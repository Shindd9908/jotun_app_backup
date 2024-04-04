part of 'journey_bloc.dart';

sealed class JourneyState extends Equatable {
  const JourneyState();
}

final class JourneyInitial extends JourneyState {
  @override
  List<Object> get props => [];
}

// -------------------- Fetch list area ----------------------

class FetchListAreaLoadingState extends JourneyState {
  @override
  List<Object> get props => [];
}

class FetchListAreaSuccessState extends JourneyState {
  final List<AreaEntity> listArea;

  const FetchListAreaSuccessState({required this.listArea});

  @override
  List<Object> get props => [listArea];
}

class FetchListAreaFailState extends JourneyState {
  @override
  List<Object> get props => [];
}

// -------------------- Fetch list area completed ----------------------

class FetchListAreaCompletedLoadingState extends JourneyState {
  @override
  List<Object> get props => [];
}

class FetchListAreaCompletedSuccessState extends JourneyState {
  final List<AreaCompletedEntity> listAreaCompleted;

  const FetchListAreaCompletedSuccessState({required this.listAreaCompleted});

  @override
  List<Object> get props => [listAreaCompleted];
}

class FetchListAreaCompletedFailState extends JourneyState {
  @override
  List<Object> get props => [];
}

// -------------------- Complete area ----------------------

class CompleteAreaLoadingState extends JourneyState {
  @override
  List<Object> get props => [];
}

class CompleteAreaSuccessState extends JourneyState {
  final String message;

  const CompleteAreaSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class CompleteAreaFailState extends JourneyState {
  final String message;

  const CompleteAreaFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// -------------------- Fetch area with event same now ----------------------

class FetchAreaHasTripSameTimeWithNowState extends JourneyState {
  final AreaEntity? area;
  final int? tripIndex;

  const FetchAreaHasTripSameTimeWithNowState({required this.area, required this.tripIndex});

  @override
  List<Object> get props => [area!, tripIndex!];
}

// -------------------- Receive gift ----------------------

class ReceiveGiftLoadingState extends JourneyState {
  @override
  List<Object> get props => [];
}

class ReceiveGiftSuccessState extends JourneyState {
  final String message;

  const ReceiveGiftSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ReceiveGiftFailState extends JourneyState {
  final String message;

  const ReceiveGiftFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// -------------------- Fetch list gift ----------------------

class FetchListGiftLoadingState extends JourneyState {
  @override
  List<Object> get props => [];
}

class FetchListGiftSuccessState extends JourneyState {
  final List<GiftEntity> listGift;

  const FetchListGiftSuccessState({required this.listGift});

  @override
  List<Object> get props => [listGift];
}

class FetchListGiftFailState extends JourneyState {
  final String message;

  const FetchListGiftFailState({required this.message});

  @override
  List<Object> get props => [message];
}
