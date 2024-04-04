import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "banner_response.g.dart";

@JsonSerializable()
class BannerResponse extends Equatable {
  @JsonKey(name: "id")
  final int? bannerId;
  @JsonKey(name: "url")
  final String? bannerURL;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updateAt;

  const BannerResponse({
    required this.bannerId,
    required this.bannerURL,
    required this.createdAt,
    required this.updateAt,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);

  @override
  List<Object?> get props => [
    bannerId,
    bannerURL,
    createdAt,
    updateAt,
  ];
}
