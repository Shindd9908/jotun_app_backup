import "package:dio/dio.dart";
import "package:jotub_app/core/models/api_response.dart";
import "package:jotub_app/features/new_products/data/models/new_product_response.dart";
import "package:retrofit/http.dart";

part "new_products_api.g.dart";

@RestApi()
abstract class NewProductsApi {
  factory NewProductsApi(Dio dio, {String baseUrl}) = _NewProductsApi;

  @GET("/products")
  Future<ApiResponse<List<NewProductResponse>>> fetchListNewProduct();
}
