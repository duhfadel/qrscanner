import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraView extends StatelessWidget {
  CameraView({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
                Navigator.pop(context, code);
              }
            }));
  }
}
