import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';
import '../model/home_work_model.dart';
import '../service/student_home_work_service.dart';

class StudentHomeWorkController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList homeWorkModel = <HomeWorkModel>[].obs;
  final service = StudentHomeWorkService(client: Supabase.instance.client);

  Future<void> getStudentHomeWork() async {
    try {
      isLoading.value = true;
      final res = await service.studentHomeWorkService();
      homeWorkModel.value = res;
      showSnackbar(AppStrings.success.tr, AppStrings.studentHomeWork.tr);
      debugPrint(
        "Student Home Work Loaded Successfully ${homeWorkModel.length}",
      );
    } catch (e) {
      showSnackbar(AppStrings.error.tr, e.toString());
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "No Date";
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  Future<void> printHomeWorkDetails({
    required HomeWorkModel hwData,
    dynamic index,
  }) async {
    try {
      final pdf = pw.Document();

      final createdDateStr = formatDate(hwData.createAt);
      final deadlineStr = formatDate(hwData.dateLine);
      final homeworkIndex = index != null
          ? (index is int ? (index + 1).toString() : index.toString())
          : "1";

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.symmetric(horizontal: 36, vertical: 36),
          header: (pw.Context context) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 20),
              padding: const pw.EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex('#1E3A8A'), // Deep Navy Blue
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "SCHOOL MANAGEMENT SYSTEM",
                        style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(
                        "OFFICIAL HOMEWORK ASSIGNMENT SHEET",
                        style: pw.TextStyle(
                          color: PdfColor.fromHex('#93C5FD'),
                          fontSize: 10,
                          fontWeight: pw.FontWeight.normal,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.white,
                      borderRadius: pw.BorderRadius.circular(6),
                    ),
                    child: pw.Text(
                      "Task #$homeworkIndex",
                      style: pw.TextStyle(
                        color: PdfColor.fromHex('#1E3A8A'),
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          footer: (pw.Context context) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(top: 15),
              padding: const pw.EdgeInsets.only(top: 8),
              decoration: const pw.BoxDecoration(
                border: pw.Border(
                  top: pw.BorderSide(color: PdfColors.grey300, width: 0.8),
                ),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Generated via School Management App",
                    style: const pw.TextStyle(color: PdfColors.grey600, fontSize: 8),
                  ),
                  pw.Text(
                    "Page ${context.pageNumber} of ${context.pagesCount}",
                    style: const pw.TextStyle(color: PdfColors.grey600, fontSize: 8),
                  ),
                ],
              ),
            );
          },
          build: (pw.Context context) {
            return [
              // Details Card
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex('#F8FAFC'),
                  borderRadius: pw.BorderRadius.circular(8),
                  border: pw.Border.all(
                    color: PdfColor.fromHex('#E2E8F0'),
                    width: 1,
                  ),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "ASSIGNMENT INFORMATION",
                      style: pw.TextStyle(
                        color: PdfColor.fromHex('#334155'),
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Divider(color: PdfColor.fromHex('#E2E8F0'), thickness: 1),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Subject",
                            hwData.subject ?? "N/A",
                          ),
                        ),
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Class",
                            hwData.className ?? "N/A",
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 12),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Section",
                            hwData.section ?? "N/A",
                          ),
                        ),
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Assigned Date",
                            createdDateStr,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 12),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Submission Deadline",
                            deadlineStr,
                            isDeadline: true,
                          ),
                        ),
                        pw.Expanded(
                          child: _buildPdfInfoItem(
                            "Status",
                            "Active / In Progress",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 20),

              // Homework Task Content Card
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.white,
                  borderRadius: pw.BorderRadius.circular(8),
                  border: pw.Border.all(
                    color: PdfColor.fromHex('#CBD5E1'),
                    width: 1,
                  ),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "HOMEWORK INSTRUCTIONS & DESCRIPTION",
                      style: pw.TextStyle(
                        color: PdfColor.fromHex('#1E293B'),
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Divider(color: PdfColor.fromHex('#E2E8F0'), thickness: 1),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      hwData.addHomework != null && hwData.addHomework!.trim().isNotEmpty
                          ? hwData.addHomework!
                          : "No homework instructions provided.",
                      style: pw.TextStyle(
                        fontSize: 11,
                        lineSpacing: 2,
                        color: PdfColor.fromHex('#1E293B'),
                      ),
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 24),

              // Student & Teacher Sign-off section
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColor.fromHex('#E2E8F0')),
                  borderRadius: pw.BorderRadius.circular(6),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 25),
                        pw.Container(
                          width: 160,
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(color: PdfColors.grey600, width: 0.8),
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          "Student Signature & Date",
                          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 25),
                        pw.Container(
                          width: 160,
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(color: PdfColors.grey600, width: 0.8),
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          "Teacher Signature & Date",
                          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      );

      final sanitizeSubject = (hwData.subject ?? 'Homework').replaceAll(RegExp(r'[^\w\s-]'), '');
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: 'Homework_${sanitizeSubject}_Task$homeworkIndex',
      );
    } catch (e) {
      debugPrint("Error generating PDF: $e");
      showSnackbar(AppStrings.error.tr, "Failed to print homework: $e");
    }
  }

  pw.Widget _buildPdfInfoItem(String label, String value, {bool isDeadline = false}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label.toUpperCase(),
          style: const pw.TextStyle(
            color: PdfColors.grey600,
            fontSize: 9,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          value,
          style: pw.TextStyle(
            color: isDeadline ? PdfColor.fromHex('#DC2626') : PdfColor.fromHex('#0F172A'),
            fontSize: 11,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ],
    );
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

  @override
  void onInit() {
    super.onInit();
    getStudentHomeWork();
  }
}
