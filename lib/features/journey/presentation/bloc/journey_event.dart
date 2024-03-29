part of 'journey_bloc.dart';

sealed class JourneyEvent extends Equatable {
  const JourneyEvent();
}

class FetchListAreaEvent extends JourneyEvent {
  @override
  List<Object?> get props => [];
}

class FetchListAreaCompletedEvent extends JourneyEvent {
  @override
  List<Object?> get props => [];
}

class FetchListGiftEvent extends JourneyEvent {
  final int type;

  const FetchListGiftEvent({required this.type});

  @override
  List<Object?> get props => [type];
}

class CompleteAreaEvent extends JourneyEvent {
  final int areaId;

  const CompleteAreaEvent({required this.areaId});

  @override
  List<Object?> get props => [areaId];
}

class ReceiveGiftEvent extends JourneyEvent {
  final int giftId;
  final int type;

  const ReceiveGiftEvent({required this.giftId, required this.type});

  @override
  List<Object?> get props => [giftId, type];
}
