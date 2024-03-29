import 'package:flutter/material.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({super.key});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  final ValueNotifier _resultScanQRCode = ValueNotifier<Barcode?>(null);

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
        child: Column(
          children: [
            Image.asset(
              AppAssets.imgLogoApp,
              width: AppHelper.setMultiDeviceSize(40.w, 40.w),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(48, 48), bottom: AppHelper.setMultiDeviceSize(36, 36)),
              child: TextWidget(
                text: S.of(context).please_scan_qrcode_each_area,
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(20.sp, 16.sp),
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: AppHelper.setMultiDeviceSize(30.w, 100.w - 64),
              height: AppHelper.setMultiDeviceSize(30.w, 100.w - 64),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.colorMainWhite,
              ),
              child: QRView(
                key: _qrKey,
                onQRViewCreated: (qrViewController) {
                  qrViewController.scannedDataStream.listen((scanData) {
                    _resultScanQRCode.value = scanData;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
