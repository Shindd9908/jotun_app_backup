import 'package:dartz/dartz.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/authentication/data/mapper/authenticaton_mapper.dart';
import 'package:jotub_app/features/authentication/data/models/user_login_response.dart';
import 'package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart';
import 'package:jotub_app/features/home/data/data_sources/home_api.dart';
import 'package:jotub_app/features/home/data/mapper/banner_mapper.dart';
import 'package:jotub_app/features/home/data/models/banner_response.dart';
import 'package:jotub_app/features/home/domain/entities/banner_entity.dart';
import 'package:jotub_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi homeApi;

  HomeRepositoryImpl({required this.homeApi});

  @override
  Future<Either<String, List<BannerEntity>>> fetchListBanner() async {
    try {
      final result = await homeApi.fetchListBanner();
      if (result.isSuccess) {
        final data = result.getValue() as List<BannerResponse>;
        List<BannerEntity> listBannerMapper = data.map((e) => e.bannerEntity).toList();
        return Right(listBannerMapper);
      } else {
        return Left(result.message!);
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, UserInfoEntity>> fetchUserProfile() async {
    try {
      final result = await homeApi.fetchUserProfile();
      if (result.isSuccess) {
        final data = result.getValue() as UserLoginResponse;
        return Right(data.userInfoEntity);
      } else {
        return Left(result.message!);
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
