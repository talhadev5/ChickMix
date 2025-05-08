import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../config/config_io.dart';
import '../../widgets/widget_io.dart';

class ResultScreen extends StatelessWidget {
  final Widget listData;
  final GlobalKey previewContainer = GlobalKey();

  ResultScreen({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'EEEE dd MMM, yyyy h:mma',
    ).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Estimation Result"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => captureAndShare(previewContainer),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: previewContainer,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(0, 4),
                child: flipImg(MyImages.invoiceClip),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: MyColors.white,
                child: Column(
                  children: [
                    appAd(),
                    gapBox(6),
                    const Divider(thickness: 1, height: 20),
                    heading18('Estimation'),
                    gapBox(3),
                    infoText(formattedDate),
                    listData,
                    const Divider(thickness: 1, height: 20),
                    heading18('Thank You!'),
                    gapBox(3),
                    infoText('Powered by Poul3y App'),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -5),
                child: flipImg(MyImages.invoiceClip, flip: 'v'),
              ),
              gapBox(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWithLabel(
                    icon: Icons.home,
                    label: 'Back',
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconWithLabel(
                    icon: Icons.share_rounded,
                    label: 'Share',
                    onPressed: () => captureAndShare(previewContainer),
                  ),
                ],
              ),
              gapBox(20),
            ],
          ),
        ),
      ),
    );
  }
}

/// 📸 Capture Widget and Share as Image
Future<void> captureAndShare(GlobalKey previewContainer) async {
  try {
    RenderRepaintBoundary boundary =
        previewContainer.currentContext!.findRenderObject()
            as RenderRepaintBoundary;

    var image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file =
        await File('${tempDir.path}/poultry_estimation_result.png').create();
    await file.writeAsBytes(pngBytes);

    // ignore: deprecated_member_use
    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Here is your Poultry Estimation,\nDownload our app at: poul3y.com',
    );
  } catch (e) {
    Get.snackbar("Error", "Failed to capture and share image.");
  }
}
