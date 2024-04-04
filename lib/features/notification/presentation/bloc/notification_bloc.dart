import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/notification/domain/entities/notification_entity.dart';
import 'package:jotub_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationBloc({required this.notificationRepository}) : super(NotificationInitial()) {
    on<GetListNotificationEvent>(_getListNotification);
  }

  Future<void> _getListNotification(GetListNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(GetListNotificationLoading());
    final getListData = await notificationRepository.getListNotificationData();
    getListData.fold(
      (l) => emit(GetListNotificationFailure(message: l)),
      (r) => emit(GetListNotificationSuccess(notificationDataEntity: r)),
    );
  }
}
