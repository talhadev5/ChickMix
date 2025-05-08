import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../config/config_io.dart';
import 'widget_io.dart';

final GlobalKey previewContainer = GlobalKey();

customReceipt(BuildContext context, Widget listData) {
  final String formattedDate = DateFormat(
    'EEEE dd MMM, yyyy h:mma',
  ).format(DateTime.now());

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Receipt",
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            content: RepaintBoundary(
              key: previewContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(0, 1),
                    child: flipImg(MyImages.invoiceClip),
                  ),
                  Container(
                    color: MyColors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        appAd(),
                        gapBox(6),
                        Divider(thickness: 1, height: 20),
                        heading18('Estimation'),
                        gapBox(3),
                        infoText(formattedDate),
                        listData,
                        Divider(thickness: 1, height: 20),
                        heading18('Thank You!'),
                        gapBox(3),
                        infoText('Powered by Poul3y App'),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -5),
                    child: flipImg(MyImages.invoiceClip, flip: 'v'),
                  ),
                ],
              ),
            ),
            actions: [
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
                    onPressed: () => captureAndShare(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.4), // Slide from bottom
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: child,
        ),
      );
    },
  );
}

/// 📸 Capture Widget and Share as Image
Future<void> captureAndShare() async {
  try {
    RenderRepaintBoundary boundary =
        previewContainer.currentContext!.findRenderObject()
            as RenderRepaintBoundary;

    var image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file =
        await File('${tempDir.path}/poultry_estimation_recipt.png').create();
    await file.writeAsBytes(pngBytes);

    // ignore: deprecated_member_use
    await Share.shareXFiles(
      [XFile(file.path)],
      text:
          'Here is your Poultry Estimation receipt,\nDownload Free our app on PlayStore \nFollow us @Poul3y',
    );
  } catch (e) {
    Get.snackbar("Error", "Failed to capture and share image.");
  }
}
