import 'package:hive/hive.dart';

class AuthSessionLocalDataSource {
  AuthSessionLocalDataSource(this._authBox);

  static const String _sessionKey = 'active_session';

  final Box _authBox;

  bool get hasActiveSession {
    final session = _authBox.get(_sessionKey);
    if (session is! Map) {
      return false;
    }

    final token = session['token']?.toString() ?? '';
    final email = session['email']?.toString() ?? '';

    return token.isNotEmpty && email.isNotEmpty;
  }

  Map<String, dynamic>? getActiveSession() {
    final session = _authBox.get(_sessionKey);
    if (session is Map) {
      return Map<String, dynamic>.from(session);
    }
    return null;
  }

  Future<void> saveSession(Map<String, dynamic> authResponse) async {
    await _authBox.put(_sessionKey, authResponse);
  }

  Future<void> clearSession() async {
    await _authBox.delete(_sessionKey);
  }
}
