import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/student_show_model.dart';
import '../service/student_show_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TeacherResultController extends GetxController {
  final service = StudentShowService(supabaseClient: Supabase.instance.client);

  final RxBool isLoading = false.obs;
  final RxList<StudentShowModel> studentResult = <StudentShowModel>[].obs;
  final searchCLT = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllStudentResult();
  }

  Future<void> getAllStudentResult() async {
    try {
      isLoading.value = true;
      debugPrint("Fetching all student results...");
      final response = await service.getAllResult();
      debugPrint("Fetched ${response.length} results successfully.");
      studentResult.assignAll(response);
    } catch (e, stacktrace) {
      debugPrint("Error fetching results: $e");
      debugPrint("Stacktrace: $stacktrace");
      showSnackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> generateAndPrintPdf({
    required String className,
    required String exam,
    required List<StudentShowModel> students,
  }) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Header(
                level: 0,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Class: $className',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Exam: $exam',
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              if (students.isEmpty)
                pw.Center(child: pw.Text("No results available."))
              else
                pw.TableHelper.fromTextArray(
                  context: context,
                  headers: ['Roll', 'ID', 'Name', 'GPA', 'Subject', 'Section'],
                  data: students
                      .map(
                        (student) => [
                          student.roll?.toString() ?? 'N/A',
                          student.id?.toString() ?? 'N/A',
                          student.name ?? 'N/A',
                          student.mark?.toString() ?? '0',
                          student.subject ?? 'N/A',
                          student.section ?? 'N/A',
                        ],
                      )
                      .toList(),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  headerDecoration: const pw.BoxDecoration(
                    color: PdfColors.grey300,
                  ),
                  rowDecoration: const pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(
                        color: PdfColors.grey400,
                        width: 0.5,
                      ),
                    ),
                  ),
                  cellAlignment: pw.Alignment.centerLeft,
                ),
            ];
          },
        ),
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: '${className}_${exam}_Result',
      );
    } catch (e) {
      showSnackbar("Error", "Failed to generate PDF: $e");
    }
  }

  // Future<void> getStudentResult(
  //   String classID,
  //   String sectionID,
  //   String examID,
  // ) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await service.getResult(classID, sectionID, examID);
  //     studentResult.assignAll(response);
  //     showSnackbar("Success", "Student Result Fetched Successfully");
  //   } catch (e) {
  //     showSnackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

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
