import "package:dartz/dartz.dart";
import "package:jotub_app/features/new_products/domain/entities/new_product_entity.dart";

abstract class NewProductsRepository {
  Future<Either<String, List<NewProductEntity>>> fetchListNewProduct();
}
