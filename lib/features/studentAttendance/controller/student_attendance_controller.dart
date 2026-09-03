import 'package:get/get.dart';
import '../models/student_model.dart';

class StudentAttendanceController extends GetxController {
  // Dummy data list for now. Later fetch from Supabase.
  var studentList = <StudentModel>[
    StudentModel(id: '1', name: 'Prajesh Shakya'),
    StudentModel(id: '2', name: 'Mahabub Alom'),
    StudentModel(id: '3', name: 'Rakibul Hasan'),
    StudentModel(id: '4', name: 'Sumaiya Akter'),
    StudentModel(id: '5', name: 'Fahim Rahman'),
    StudentModel(id: '6', name: 'Sadia Islam'),
    StudentModel(id: '7', name: 'Nazmul Huda'),
    StudentModel(id: '8', name: 'Nusrat Jahan'),
    StudentModel(id: '9', name: 'Tanvir Ahmed'),
    StudentModel(id: '10', name: 'Mehedi Hasan'),
    StudentModel(id: '11', name: 'Asif Iqbal'),
    StudentModel(id: '12', name: 'Farhana Yesmin'),
    StudentModel(id: '13', name: 'Jisan Mahmud'),
    StudentModel(id: '14', name: 'Jannatul Ferdous'),
    StudentModel(id: '15', name: 'Sakib Al Hasan'),
    StudentModel(id: '16', name: 'Tahsan Khan'),
    StudentModel(id: '17', name: 'Ayesha Siddiqa'),
    StudentModel(id: '18', name: 'Mushfiqur Rahim'),
    StudentModel(id: '19', name: 'Nayeem Islam'),
    StudentModel(id: '20', name: 'Saima Akter'),
  ].obs;

  void togglePresence(String id, bool? value) {
    var student = studentList.firstWhere((s) => s.id == id);
    if (value == true) {
      student.isPresent.value = true;
      student.isAbsent.value = false;
    } else {
      student.isPresent.value = false;
    }
  }

  void toggleAbsence(String id, bool? value) {
    var student = studentList.firstWhere((s) => s.id == id);
    if (value == true) {
      student.isAbsent.value = true;
      student.isPresent.value = false;
    } else {
      student.isAbsent.value = false;
    }
  }
}
