import "package:equatable/equatable.dart";

class NewProductEntity extends Equatable {
  final int? productId;
  final String? productName;
  final String? description;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final String? capacity;

  const NewProductEntity({this.productId, this.productName, this.description, this.image, this.createdAt, this.updatedAt, this.capacity});

  @override
  List<Object?> get props => [productId, productName, description, image, createdAt, updatedAt, capacity];
}
