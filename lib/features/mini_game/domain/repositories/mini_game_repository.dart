import 'package:dartz/dartz.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';

abstract class MiniGameRepository {
  List<String> getDataMiniGame();
  List<GlobalKey<FlipCardState>> getCardStateKeys();
  Future<Either<String, GiftEntity>> fetchGift();
}
