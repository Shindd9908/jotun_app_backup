import "package:equatable/equatable.dart";

class BannerEntity extends Equatable {
  final int? bannerId;
  final String? bannerURL;
  final String? createAt;
  final String? updateAt;

  const BannerEntity({this.bannerId, this.bannerURL, this.createAt, this.updateAt});

  @override
  List<Object?> get props => [bannerId, bannerURL, createAt, updateAt];
}
