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
  String get salesStaffCharge {
    return Intl.message(
      'Nhân viên bán hàng phụ trách',
      name: 'salesStaffCharge',
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

  /// `Xác nhận thông tin`
  String get confirmInformation {
    return Intl.message(
      'Xác nhận thông tin',
      name: 'confirmInformation',
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

  /// `Hãy nhập vai để bảo chứng chất lượng\nJotashield Bền màu toàn diện`
  String get explainJourney {
    return Intl.message(
      'Hãy nhập vai để bảo chứng chất lượng\nJotashield Bền màu toàn diện',
      name: 'explainJourney',
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
