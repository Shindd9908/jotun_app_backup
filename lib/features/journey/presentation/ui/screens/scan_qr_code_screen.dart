import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/popup_dialog_alert.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCodeScreen extends StatefulWidget {
  final AreaEntity area;

  const ScanQRCodeScreen({super.key, required this.area});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrViewController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController!.resumeCamera();
    }
  }

  @override
  void dispose() {
    _qrViewController!.dispose();
    super.dispose();
  }

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
              width: AppHelper.setMultiDeviceSize(context, 40.w, 40.w),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppHelper.setMultiDeviceSize(context, 48, 48), bottom: AppHelper.setMultiDeviceSize(context, 36, 36)),
              child: TextWidget(
                text: S.of(context).pleaseScanQRCodeEachArea,
                color: AppColor.colorMainWhite,
                fontSize: AppHelper.setMultiDeviceSize(context, 20.sp, 16.sp),
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: AppHelper.setMultiDeviceSize(context, 30.w, 100.w - 64),
              height: AppHelper.setMultiDeviceSize(context, 30.w, 100.w - 64),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.colorMainWhite,
              ),
              child: QRView(
                key: _qrKey,
                overlay: QrScannerOverlayShape(
                  borderColor: AppColor.colorMainWhite,
                  borderRadius: 0,
                  borderLength: 5,
                  borderWidth: 5,
                  cutOutSize: AppHelper.setMultiDeviceSize(context, 30.w, 100.w - 64) - 80,
                ),
                onQRViewCreated: (qrViewController) {
                  _qrViewController = qrViewController;
                  qrViewController.scannedDataStream.listen((scanData) async {
                    if (scanData.code != null && scanData.code!.isNotEmpty && widget.area.areaCode != null && scanData.code!.contains(widget.area.areaCode!)) {
                      await _qrViewController!.stopCamera();
                      if (mounted) {
                        Navigator.of(context).pushNamed(AppPaths.answerQuestionScreen, arguments: {'area': widget.area});
                      }
                    } else {
                      await _qrViewController!.pauseCamera();
                      if (mounted) {
                        await PopupDialogAlert.showPopupWithUIParamHasBell(
                          context,
                          Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextWidget(
                                  text: S.of(context).scanQRCodeAreaWrong,
                                  color: AppColor.colorMainYellow,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 60),
                                  child: Divider(height: 1, color: AppColor.colorMainBlack),
                                ),
                                TextWidget(
                                  text: '${S.of(context).pleaseMoveOtherArea} ${widget.area.areaName ?? ''} ${S.of(context).toReScan}',
                                  color: AppColor.colorMainBlack,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ).whenComplete(() async {
                          await _qrViewController!.resumeCamera();
                        });
                      }
                    }
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
