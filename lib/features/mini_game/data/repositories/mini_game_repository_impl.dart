import 'package:dartz/dartz.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/journey/data/models/receive_gift_request.dart';
import 'package:jotub_app/features/mini_game/data/data_sources/mini_game_api.dart';
import 'package:jotub_app/features/mini_game/data/mapper/gift_mapper.dart';
import 'package:jotub_app/features/mini_game/data/models/gift_response.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';
import 'package:jotub_app/features/mini_game/domain/repositories/mini_game_repository.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/utils/constants/constants.dart';

class MiniGameRepositoryImpl implements MiniGameRepository {
  final MiniGameApi miniGameApi;

  MiniGameRepositoryImpl({required this.miniGameApi});

  @override
  List<String> getDataMiniGame() {
    List<String> assets = [
      AppAssets.itemMiniGame1,
      AppAssets.itemMiniGame2,
      AppAssets.itemMiniGame3,
      AppAssets.itemMiniGame4,
      AppAssets.itemMiniGame5,
      AppAssets.itemMiniGame6,
      AppAssets.itemMiniGame7,
      AppAssets.itemMiniGame8,
    ];
    List<String> data = List.from(assets)..addAll(assets.reversed);
    data.shuffle();
    return data;
  }

  @override
  List<GlobalKey<FlipCardState>> getCardStateKeys() {
    List<GlobalKey<FlipCardState>> cardStateKeys = List.generate(16, (_) => GlobalKey<FlipCardState>());
    return cardStateKeys;
  }

  @override
  Future<Either<String, GiftEntity>> fetchGift() async {
    try {
      final result = await miniGameApi.fetchListGift(Constants.typeGiftMiniGame.toString());
      if (result.isSuccess) {
        final data = result.getValue() as List<GiftResponse>;
        List<GiftEntity> listGiftMapper = data.map((e) => e.giftEntity).toList();
        listGiftMapper.shuffle();
        return Right(listGiftMapper.first);
      } else {
        return Left(result.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, List<GiftEntity>>> fetchReceivedGift() async {
    try {
      final result = await miniGameApi.fetchListReceivedGift(Constants.typeGiftMiniGame.toString());
      if (result.isSuccess) {
        final data = result.getValue() as List<GiftResponse>;
        List<GiftEntity> listGiftMapper = data.map((e) => e.giftEntity).toList();
        return Right(listGiftMapper);
      } else {
        return Left(result.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> receivedGift(int giftId, int type) async {
    try {
      final result = await miniGameApi.receivedGift(ReceiveGiftRequest(giftId: giftId, type: type));
      if (result.isSuccess) {
        return Right(result.message ?? '');
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
