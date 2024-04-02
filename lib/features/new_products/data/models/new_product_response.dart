import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "new_product_response.g.dart";

@JsonSerializable()
class NewProductResponse extends Equatable {
  @JsonKey(name: "id")
  final int? productId;
  @JsonKey(name: "name")
  final String? productName;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "capacity")
  final String? capacity;

  const NewProductResponse({
    this.productId,
    this.productName,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.capacity,
  });

  factory NewProductResponse.fromJson(Map<String, dynamic> json) => _$NewProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewProductResponseToJson(this);

  @override
  List<Object?> get props => [productId, productName, description, image, createdAt, updatedAt, capacity];
}
