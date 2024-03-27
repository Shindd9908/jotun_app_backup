part of 'journey_bloc.dart';

sealed class JourneyEvent extends Equatable {
  const JourneyEvent();
}

class FetchListAreaEvent extends JourneyEvent {
  @override
  List<Object?> get props => [];
}
