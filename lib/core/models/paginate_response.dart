import "package:json_annotation/json_annotation.dart";
part "paginate_response.g.dart";

@JsonSerializable()
class Paginate {
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "total_page")
  final int? totalPage;

  const Paginate({
    this.limit,
    this.total,
    this.currentPage,
    this.size,
    this.totalPage,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) => _$PaginateFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateToJson(this);
}
