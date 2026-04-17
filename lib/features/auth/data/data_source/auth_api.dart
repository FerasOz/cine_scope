import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AuthApi {
  AuthApi(this._authBox) {
    _ensureSeedUser();
  }

  static const String _usersKey = 'registered_users';

  final Box _authBox;

  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final normalizedEmail = _normalizeEmail(email);
    final normalizedPassword = password.trim();

    _validateLoginInput(normalizedEmail, normalizedPassword);

    final user = _findUserByEmail(normalizedEmail);

    if (user == null) {
      throw _badResponseError(
        statusCode: 404,
        message: 'No account found for this email.',
      );
    }

    if (user['password'] != normalizedPassword) {
      throw _badResponseError(
        statusCode: 401,
        message: 'Incorrect password. Please try again.',
      );
    }

    return _buildAuthResponse(user);
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final normalizedName = name.trim();
    final normalizedEmail = _normalizeEmail(email);
    final normalizedPassword = password.trim();

    _validateRegisterInput(
      name: normalizedName,
      email: normalizedEmail,
      password: normalizedPassword,
    );

    final existingUser = _findUserByEmail(normalizedEmail);
    if (existingUser != null) {
      throw _badResponseError(
        statusCode: 409,
        message: 'This email is already registered.',
      );
    }

    final newUser = <String, dynamic>{
      'id': (_registeredUsers.length + 1).toString(),
      'name': normalizedName,
      'email': normalizedEmail,
      'password': normalizedPassword,
      'createdAt': DateTime.now().toIso8601String(),
    };

    final users = _registeredUsers;
    users.add(newUser);
    _saveUsers(users);

    return _buildAuthResponse(newUser);
  }

  Map<String, dynamic>? _findUserByEmail(String email) {
    for (final user in _registeredUsers) {
      if (user['email'] == email) {
        return user;
      }
    }
    return null;
  }

  List<Map<String, dynamic>> get _registeredUsers {
    final storedUsers = _authBox.get(_usersKey);
    if (storedUsers is List) {
      return storedUsers
          .whereType<Map>()
          .map((user) => Map<String, dynamic>.from(user))
          .toList();
    }
    return [];
  }

  void _saveUsers(List<Map<String, dynamic>> users) {
    _authBox.put(_usersKey, users);
  }

  void _ensureSeedUser() {
    if (_registeredUsers.isNotEmpty) {
      return;
    }

    _saveUsers([
      {
        'id': '1',
        'name': 'Feras',
        'email': 'test@test.com',
        'password': '123456',
        'createdAt': DateTime(2026, 1, 1).toIso8601String(),
      },
    ]);
  }

  Map<String, dynamic> _buildAuthResponse(Map<String, dynamic> user) {
    return {
      'id': user['id'],
      'name': user['name'],
      'email': user['email'],
      'token': _generateFakeToken(user),
    };
  }

  String _normalizeEmail(String email) => email.trim().toLowerCase();

  void _validateLoginInput(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Email and password are required.',
      );
    }

    if (!_isValidEmail(email)) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Please enter a valid email address.',
      );
    }
  }

  void _validateRegisterInput({
    required String name,
    required String email,
    required String password,
  }) {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Name, email and password are required.',
      );
    }

    if (name.length < 3) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Name must be at least 3 characters long.',
      );
    }

    if (!_isValidEmail(email)) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Please enter a valid email address.',
      );
    }

    if (password.length < 6) {
      throw _badResponseError(
        statusCode: 400,
        message: 'Password must be at least 6 characters long.',
      );
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email);
  }

  String _generateFakeToken(Map<String, dynamic> user) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'fake_token_${user['id']}_$timestamp';
  }

  DioException _badResponseError({
    required int statusCode,
    required String message,
  }) {
    return DioException(
      requestOptions: RequestOptions(path: '/auth'),
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: RequestOptions(path: '/auth'),
        statusCode: statusCode,
        data: {
          'success': false,
          'status_code': statusCode,
          'status_message': message,
        },
      ),
    );
  }
}
