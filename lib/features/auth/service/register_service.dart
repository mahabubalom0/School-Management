import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterService {
  final SupabaseClient _supabaseClient;
  RegisterService(this._supabaseClient);

  Future<AuthResponse> signUpUser({
    required String email,
    required String password,
    required String name,
    required String className,
    required String section,
    required String rollNo,
    required String group,
    required String address,
    required String gender,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password, 
        data: {
          'name': name,
          'class': className,
          'section': section,
          'roll_no': rollNo,
          'group': group,
          'address': address,
          'gender': gender,
        },
      );

      return response;
    } catch (e) {
      throw AuthApiException(e.toString());
    }
  }
}
