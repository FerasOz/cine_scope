class AuthApi {
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return {
      "id": "1",
      "name": "Feras",
      "email": email,
      "token": "fake_token_123"
    };
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return {
      "id": "1",
      "name": name,
      "email": email,
      "token": "fake_token_123"
    };
  }
}