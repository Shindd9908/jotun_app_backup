import 'package:dartz/dartz.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/new_products/data/data_source/new_products_api.dart';
import 'package:jotub_app/features/new_products/data/mapper/new_product_mapper.dart';
import 'package:jotub_app/features/new_products/data/models/new_product_response.dart';
import 'package:jotub_app/features/new_products/domain/entities/new_product_entity.dart';
import 'package:jotub_app/features/new_products/domain/repositories/new_products_repository.dart';

class NewProductsRepositoryImpl implements NewProductsRepository {
  final NewProductsApi newProductsApi;

  NewProductsRepositoryImpl({required this.newProductsApi});

  @override
  Future<Either<String, List<NewProductEntity>>> fetchListNewProduct() async {
    try {
      final result = await newProductsApi.fetchListNewProduct();
      if (result.isSuccess) {
        final data = result.getValue() as List<NewProductResponse>;
        List<NewProductEntity> listNewProductMapper = data.map((e) => e.newProductEntity).toList();
        return Right(listNewProductMapper);
      } else {
        return Left(result.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
