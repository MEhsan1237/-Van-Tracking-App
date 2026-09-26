import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../viewmodels/driver_viewmodel.dart';

class DriverScannerView extends GetView<DriverViewModel> {
  const DriverScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Attendance Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () {
              Get.snackbar('Flash Toggle', 'Camera flash toggled.');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera Stream Scanner
          MobileScanner(
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  controller.processQrCode(barcode.rawValue!);
                  break;
                }
              }
            },
          ),

          // Target Overlay Frame
          Center(
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.warmGold, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Align Student QR Card Inside Frame',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),

          // Manual Code Simulation Panel at Bottom
          Positioned(
            bottom: 20,
            left: size.width * 0.04,
            right: size.width * 0.04,
            child: Card(
              color: Colors.black.withOpacity(0.85),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'TEST / DEMO SCAN SIMULATOR',
                      style: TextStyle(color: AppColors.softBeige, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.teal),
                            onPressed: () => controller.processQrCode('QR-ALI-101'),
                            child: const Text('Scan Ali (STU-101)'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.warmGold),
                            onPressed: () => controller.processQrCode('QR-INVALID-99'),
                            child: const Text('Scan Unassigned'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
