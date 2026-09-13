import 'package:supabase_flutter/supabase_flutter.dart';

class AddStudentService {
  SupabaseClient supabaseClient;
  AddStudentService(this.supabaseClient);

  Future<dynamic> addStudent({
    required String name,
    required String email,
    required String studentRool,
    required String studentGender,
    required String classAdmission,
    required String fatherName,
    required String motherName,
    required String dateOfBirth,
    required String religion,
    required String bloodGroup,
    required String gradientPhoneNumber,
    required String studentPhone,
    required String address,
  }) async {
    try {
     final response = await supabaseClient.from("student_list").insert({
        "name": name,
        "email": email,
        "student_id": studentRool,
        "gender": studentGender,
        "class": classAdmission,
        "father_name": fatherName,
        "mother_name": motherName,
        "date_birth": dateOfBirth,
        "religion": religion,
        "blood_group": bloodGroup,
        "guardin_number": gradientPhoneNumber,
        "student_number": studentPhone,
        "address": address,
      }).select();
     
      return response;
    } on PostgrestException catch (e) {
      throw e.message;
    } catch (e) {
      throw "An unexpected error occurred. Please try again.";
    }
  }
}
