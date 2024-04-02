// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `HÀNH TRÌNH KHÁM PHÁ`
  String get journeyDiscovery {
    return Intl.message(
      'HÀNH TRÌNH KHÁM PHÁ',
      name: 'journeyDiscovery',
      desc: '',
      args: [],
    );
  }

  /// `SỰ TOÀN DIỆN`
  String get inclusiveness {
    return Intl.message(
      'SỰ TOÀN DIỆN',
      name: 'inclusiveness',
      desc: '',
      args: [],
    );
  }

  /// `Đối tượng sử dụng`
  String get objectUse {
    return Intl.message(
      'Đối tượng sử dụng',
      name: 'objectUse',
      desc: '',
      args: [],
    );
  }

  /// `Đại lý`
  String get agency {
    return Intl.message(
      'Đại lý',
      name: 'agency',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên Jotun`
  String get memberOfJotun {
    return Intl.message(
      'Nhân viên Jotun',
      name: 'memberOfJotun',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập`
  String get phoneNumber {
    return Intl.message(
      'Tên đăng nhập',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get changePassword {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới`
  String get newPassword {
    return Intl.message(
      'Mật khẩu mới',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu mới`
  String get confirmNewPassword {
    return Intl.message(
      'Xác nhận mật khẩu mới',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get logout {
    return Intl.message(
      'Đăng xuất',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin tài khoản`
  String get accountInformation {
    return Intl.message(
      'Thông tin tài khoản',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get fullName {
    return Intl.message(
      'Họ và tên',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Cửa hàng`
  String get store {
    return Intl.message(
      'Cửa hàng',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Căn cước công dân`
  String get idCardNumber {
    return Intl.message(
      'Căn cước công dân',
      name: 'idCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên bán hàng phụ trách`
  String get salesNameStaffCharge {
    return Intl.message(
      'Nhân viên bán hàng phụ trách',
      name: 'salesNameStaffCharge',
      desc: '',
      args: [],
    );
  }

  /// `SĐT nhân viên bán hàng`
  String get salesPhoneNumberStaffCharge {
    return Intl.message(
      'SĐT nhân viên bán hàng',
      name: 'salesPhoneNumberStaffCharge',
      desc: '',
      args: [],
    );
  }

  /// `Nhóm`
  String get group {
    return Intl.message(
      'Nhóm',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Số xe bus`
  String get busNo {
    return Intl.message(
      'Số xe bus',
      name: 'busNo',
      desc: '',
      args: [],
    );
  }

  /// `Khách sạn`
  String get hotel {
    return Intl.message(
      'Khách sạn',
      name: 'hotel',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận thông tin`
  String get confirmInformation {
    return Intl.message(
      'Xác nhận thông tin',
      name: 'confirmInformation',
      desc: '',
      args: [],
    );
  }

  /// `Xem ảnh đại điện`
  String get showFullAvatar {
    return Intl.message(
      'Xem ảnh đại điện',
      name: 'showFullAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi ảnh đại diện`
  String get changeAvatar {
    return Intl.message(
      'Thay đổi ảnh đại diện',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh từ camera`
  String get selectAvatarFromCamera {
    return Intl.message(
      'Chọn ảnh từ camera',
      name: 'selectAvatarFromCamera',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh từ bộ sưu tập`
  String get selectAvatarFromGallery {
    return Intl.message(
      'Chọn ảnh từ bộ sưu tập',
      name: 'selectAvatarFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Sự kiện sắp diễn ra`
  String get incomingEvent {
    return Intl.message(
      'Sự kiện sắp diễn ra',
      name: 'incomingEvent',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết hành trình`
  String get goToDetailTrip {
    return Intl.message(
      'Xem chi tiết hành trình',
      name: 'goToDetailTrip',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng`
  String get feature {
    return Intl.message(
      'Tính năng',
      name: 'feature',
      desc: '',
      args: [],
    );
  }

  /// `Khám phá\nlịch trình`
  String get exploreSchedule {
    return Intl.message(
      'Khám phá\nlịch trình',
      name: 'exploreSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin sản\nphẩm mới`
  String get newProductInformation {
    return Intl.message(
      'Thông tin sản\nphẩm mới',
      name: 'newProductInformation',
      desc: '',
      args: [],
    );
  }

  /// `Trải nghiệm &\nnhận quà`
  String get experienceAndReceiveGift {
    return Intl.message(
      'Trải nghiệm &\nnhận quà',
      name: 'experienceAndReceiveGift',
      desc: '',
      args: [],
    );
  }

  /// `Mini game\n`
  String get miniGame {
    return Intl.message(
      'Mini game\n',
      name: 'miniGame',
      desc: '',
      args: [],
    );
  }

  /// `Đặt hàng trước`
  String get preorder {
    return Intl.message(
      'Đặt hàng trước',
      name: 'preorder',
      desc: '',
      args: [],
    );
  }

  /// `Chương trình\nkhuyến mãi`
  String get promotions {
    return Intl.message(
      'Chương trình\nkhuyến mãi',
      name: 'promotions',
      desc: '',
      args: [],
    );
  }

  /// `Hãy cùng chờ đón những thông tin của sản phẩm mới của Jotun Jotashield`
  String get contentPopupWelcomeNewProducts {
    return Intl.message(
      'Hãy cùng chờ đón những thông tin của sản phẩm mới của Jotun Jotashield',
      name: 'contentPopupWelcomeNewProducts',
      desc: '',
      args: [],
    );
  }

  /// `Vào ngày 08/05/2024`
  String get dateNewProductLaunched {
    return Intl.message(
      'Vào ngày 08/05/2024',
      name: 'dateNewProductLaunched',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách vui lòng trải nghiệm đủ`
  String get explainClaimReward1 {
    return Intl.message(
      'Quý khách vui lòng trải nghiệm đủ',
      name: 'explainClaimReward1',
      desc: '',
      args: [],
    );
  }

  /// `4 khu vực`
  String get fourAreas {
    return Intl.message(
      '4 khu vực',
      name: 'fourAreas',
      desc: '',
      args: [],
    );
  }

  /// `để nhận quà tặng từ Jotun!`
  String get explainClaimReward2 {
    return Intl.message(
      'để nhận quà tặng từ Jotun!',
      name: 'explainClaimReward2',
      desc: '',
      args: [],
    );
  }

  /// `Nhận quà`
  String get claimRewardButton {
    return Intl.message(
      'Nhận quà',
      name: 'claimRewardButton',
      desc: '',
      args: [],
    );
  }

  /// `Đã hoàn thành`
  String get completed {
    return Intl.message(
      'Đã hoàn thành',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get completedReceiveGift {
    return Intl.message(
      'Hoàn thành',
      name: 'completedReceiveGift',
      desc: '',
      args: [],
    );
  }

  /// `Mã sai khu vực`
  String get scanQRCodeAreaWrong {
    return Intl.message(
      'Mã sai khu vực',
      name: 'scanQRCodeAreaWrong',
      desc: '',
      args: [],
    );
  }

  /// `Mời bạn di chuyển qua`
  String get pleaseMoveOtherArea {
    return Intl.message(
      'Mời bạn di chuyển qua',
      name: 'pleaseMoveOtherArea',
      desc: '',
      args: [],
    );
  }

  /// `để quét mã`
  String get toReScan {
    return Intl.message(
      'để quét mã',
      name: 'toReScan',
      desc: '',
      args: [],
    );
  }

  /// `Chúc mừng bạn đã nhận\nđược quà từ Jotun`
  String get congratulationsReceivingGiftJotun {
    return Intl.message(
      'Chúc mừng bạn đã nhận\nđược quà từ Jotun',
      name: 'congratulationsReceivingGiftJotun',
      desc: '',
      args: [],
    );
  }

  /// `Ngày`
  String get daySchedule {
    return Intl.message(
      'Ngày',
      name: 'daySchedule',
      desc: '',
      args: [],
    );
  }

  /// `tiếng`
  String get hourSchedule {
    return Intl.message(
      'tiếng',
      name: 'hourSchedule',
      desc: '',
      args: [],
    );
  }

  /// `phút`
  String get minuteSchedule {
    return Intl.message(
      'phút',
      name: 'minuteSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Luật chơi`
  String get gameRule {
    return Intl.message(
      'Luật chơi',
      name: 'gameRule',
      desc: '',
      args: [],
    );
  }

  /// `Trong vòng 60 giây, lật tìm các\nmảnh ghép giống nhau`
  String get explainRule {
    return Intl.message(
      'Trong vòng 60 giây, lật tìm các\nmảnh ghép giống nhau',
      name: 'explainRule',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu chơi`
  String get startGame {
    return Intl.message(
      'Bắt đầu chơi',
      name: 'startGame',
      desc: '',
      args: [],
    );
  }

  /// `Khám phá dòng sản phẩm`
  String get exploreTheProductLine {
    return Intl.message(
      'Khám phá dòng sản phẩm',
      name: 'exploreTheProductLine',
      desc: '',
      args: [],
    );
  }

  /// `Jotun Jotashield bền màu\ntoàn diện`
  String get productName {
    return Intl.message(
      'Jotun Jotashield bền màu\ntoàn diện',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Phần thưởng của bạn là`
  String get yourReward {
    return Intl.message(
      'Phần thưởng của bạn là',
      name: 'yourReward',
      desc: '',
      args: [],
    );
  }

  /// `Chúc mừng bạn đã\nhoàn thành thử thách`
  String get completedMiniGame {
    return Intl.message(
      'Chúc mừng bạn đã\nhoàn thành thử thách',
      name: 'completedMiniGame',
      desc: '',
      args: [],
    );
  }

  /// `Rất tiếc bạn chưa\nhoàn thành thử thách`
  String get uncompletedMiniGame {
    return Intl.message(
      'Rất tiếc bạn chưa\nhoàn thành thử thách',
      name: 'uncompletedMiniGame',
      desc: '',
      args: [],
    );
  }

  /// `Chơi lại`
  String get playAgain {
    return Intl.message(
      'Chơi lại',
      name: 'playAgain',
      desc: '',
      args: [],
    );
  }

  /// `Quay về trang chủ`
  String get backToHome {
    return Intl.message(
      'Quay về trang chủ',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã nhận quà tặng`
  String get youHaveReceivedTheGift {
    return Intl.message(
      'Bạn đã nhận quà tặng',
      name: 'youHaveReceivedTheGift',
      desc: '',
      args: [],
    );
  }

  /// `Mỗi khách hàng chỉ nhận được một phần quà\nThời gian chơi có trúng thưởng: 8/5/2024 - 31/5/2024`
  String get timeToReceiveGift {
    return Intl.message(
      'Mỗi khách hàng chỉ nhận được một phần quà\nThời gian chơi có trúng thưởng: 8/5/2024 - 31/5/2024',
      name: 'timeToReceiveGift',
      desc: '',
      args: [],
    );
  }

  /// `QUÉT QR MỞ KHÓA`
  String get alertBlockItemArea {
    return Intl.message(
      'QUÉT QR MỞ KHÓA',
      name: 'alertBlockItemArea',
      desc: '',
      args: [],
    );
  }

  /// `HÃY QUÉT MÃ QR TƯƠNG ỨNG\nCÁC BOOTH`
  String get pleaseScanQRCodeEachArea {
    return Intl.message(
      'HÃY QUÉT MÃ QR TƯƠNG ỨNG\nCÁC BOOTH',
      name: 'pleaseScanQRCodeEachArea',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo`
  String get titleButtonNextQuestion {
    return Intl.message(
      'Tiếp theo',
      name: 'titleButtonNextQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã trả lời sai 1 số câu hỏi. Vui lòng thử lại!`
  String get alertAnswerWrong {
    return Intl.message(
      'Bạn đã trả lời sai 1 số câu hỏi. Vui lòng thử lại!',
      name: 'alertAnswerWrong',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin không được để trống`
  String get errorFieldRequired {
    return Intl.message(
      'Thông tin không được để trống',
      name: 'errorFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không đúng định dạng`
  String get errorPhoneNumberIncorrect {
    return Intl.message(
      'Số điện thoại không đúng định dạng',
      name: 'errorPhoneNumberIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Số căn cước công dân không đúng định dạng`
  String get errorIdCardNumberIncorrect {
    return Intl.message(
      'Số căn cước công dân không đúng định dạng',
      name: 'errorIdCardNumberIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu xác thực không trùng khớp`
  String get errorPasswordConfirmNotMatch {
    return Intl.message(
      'Mật khẩu xác thực không trùng khớp',
      name: 'errorPasswordConfirmNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu phải tối thiểu 8 kí tự`
  String get errorPasswordMinLength {
    return Intl.message(
      'Mật khẩu phải tối thiểu 8 kí tự',
      name: 'errorPasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Không có dữ liệu`
  String get noData {
    return Intl.message(
      'Không có dữ liệu',
      name: 'noData',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
