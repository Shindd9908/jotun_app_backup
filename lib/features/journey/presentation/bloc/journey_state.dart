part of 'journey_bloc.dart';

sealed class JourneyState extends Equatable {
  const JourneyState();
}

final class JourneyInitial extends JourneyState {
  @override
  List<Object> get props => [];
}

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
