import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../model/student_question_model.dart';
import '../service/student_solution_service.dart';

class StudentSolutionController extends GetxController {
  final questionController = TextEditingController();

  final StudentSolutionService service = StudentSolutionService(
    Supabase.instance.client,
  );
  final user = Supabase.instance.client.auth.currentUser;
  final isLoading = false.obs;
  RxList<StudentQuestionModel> questionsList = RxList<StudentQuestionModel>();
  // edite funtion variable
  final editequestionAnsController = TextEditingController();
  final editequestionController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getQuestions();
  }

  Future<void> askQuestion() async {
    if (questionController.text.trim().isEmpty) {
      showSnackbar("Error", "Please enter a question");
      return;
    }
    if (user == null) {
      showSnackbar("Error", "You are not logged in");
      return;
    }
    try {
      isLoading.value = true;
      await service.addQuestion(
        question: questionController.text,
        name: user!.email ?? "Unknown",
      );
      showSnackbar("Success", "Question added successfully");
      questionController.clear();
      getQuestions();
      Get.back();
    } catch (e) {
      showSnackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getQuestions() async {
    try {
      isLoading.value = true;
      final response = await service.getQuestion();
      if (response.isNotEmpty) {
        questionsList.assignAll(response);
      }
    } catch (e) {
      showSnackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> deleteQuestion(int id) async {
    try {
      await service.deleteQuestion(id);
      questionsList.removeWhere((element) => element.id == id);
      showSnackbar("Success", "Question deleted successfully");
      return true;
    } catch (e) {
      showSnackbar("Error", e.toString());
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> editeQuestion(int id) async {
    if (editequestionController.text.trim().isEmpty) {
      showSnackbar("Error", "Please enter a question");
      return;
    }
    if (user == null) {
      showSnackbar("Error", "You are not logged in");
      return;
    }
    try {
      isLoading.value = true;
      await service.editeQuestion(
        id: id,
        question: editequestionController.text,
        name: user!.email ?? "Unknown",
        questionAns: editequestionAnsController.text,
      );
      showSnackbar("Success", "Question edite successfully");
      questionController.clear();
      getQuestions();
      Get.back();
    } catch (e) {
      showSnackbar("Error", e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> downloadAnswerAsPdf(String question, String answer) async {
    try {
      final pdf = pw.Document();

      // Load Unicode-supported fonts for Bengali / other languages
      final font = await PdfGoogleFonts.notoSansBengaliRegular();
      final boldFont = await PdfGoogleFonts.notoSansBengaliBold();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          theme: pw.ThemeData.withFont(base: font, bold: boldFont),
          build: (pw.Context context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Question:",
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(question, style: const pw.TextStyle(fontSize: 18)),
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "Solution:",
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(answer, style: const pw.TextStyle(fontSize: 18)),
                ],
              ),
            );
          },
        ),
      );

      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: '$question solution.pdf',
      );
    } catch (e) {
      showSnackbar("Error", "Could not generate PDF: ${e.toString()}");
      debugPrint(e.toString());
    }
  }

  void showSnackbar(String title, String message) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).clearSnackBars();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            "$title: $message",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      debugPrint("Error: Get.context is null. Cannot show snackbar.");
    }
  }
}
