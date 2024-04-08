import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:health_app/screens/healthcare/widgets/threedots.dart';
import 'package:health_app/screens/reportanalysis/service/report_open_ai.dart';
import 'package:health_app/screens/reportanalysis/widgets/report.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:velocity_x/velocity_x.dart';

class ReportAnalysis extends StatefulWidget {
  const ReportAnalysis({super.key});

  @override
  State<ReportAnalysis> createState() => _ReportAnalysisState();
}

class _ReportAnalysisState extends State<ReportAnalysis> {
  late String content = "";
  late String text = 'Please add your medical report in PDF';
  late String report = "";

  bool isDisabled = true;
  bool isAnalysing = false;



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Medical Report Analyser")),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  report == ""
                      ? const SizedBox(
                          height: 200,
                        )
                      : const SizedBox(
                          height: 6,
                        ),
                  Text(text),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.cardColor,
                      ),
                      child: TextButton(
                        child: const Text("Upload File"),
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            PlatformFile file = result.files.first;
                            // Read the PDF file
                            final bytes = File(file.path!).readAsBytesSync();
                            final PdfDocument document =
                                PdfDocument(inputBytes: bytes);
                            final res =
                                PdfTextExtractor(document).extractText();
                            setState(() {
                              text = file.name;
                              isDisabled = false;
                              content = res;
                            });
                            document.dispose();
                          }
                        },
                      ),
                    ),
                  ),
                  report != ""? reportCard(report, context) : const SizedBox(),
                  if (isAnalysing) const ThreeDots(),
                ],
              ),
              ElevatedButton(
                onPressed: isDisabled
                    ? null
                    : () async {
                        setState(() {
                          isAnalysing = true;
                        });
                        String res = await generateReportAnalysis(content);
                        setState(() {
                          report = res;
                          isAnalysing = false;
                        });
                      },
                child: const Text("Analyse Report"),
              )
            ],
          ),
        ));
  }
}
