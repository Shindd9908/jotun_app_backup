import "package:jotub_app/features/new_products/data/models/new_product_response.dart";
import "package:jotub_app/features/new_products/domain/entities/new_product_entity.dart";

extension NewProductMapExt on NewProductResponse {
  NewProductEntity get newProductEntity => NewProductEntity(
        productId: productId,
        productName: productName,
        description: description,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
        capacity: capacity,
      );
}
