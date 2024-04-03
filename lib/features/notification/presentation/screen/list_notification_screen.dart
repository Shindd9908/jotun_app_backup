import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/global_widgets/custom_flush_bar.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ListNotificationScreen extends StatefulWidget {
  const ListNotificationScreen({super.key});

  @override
  State<ListNotificationScreen> createState() => _ListNotificationScreenState();
}

class _ListNotificationScreenState extends State<ListNotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(GetListNotificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      isHasButtonBack: true,
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listenWhen: (context, state) => state is GetListNotificationFailure,
        listener: (context, state) {
          if (state is GetListNotificationFailure) {
            CustomFlushBar.showAlertFlushBar(context, state.message);
          }
        },
        buildWhen: (context, state) => state is GetListNotificationLoading || state is GetListNotificationSuccess || state is GetListNotificationFailure,
        builder: (context, state) {
          return (state is GetListNotificationSuccess)
              ? Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColor.colorMainWhite,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: state.notificationDataEntity.notificationsDetailEntity?[index].title,
                                color: AppColor.colorMainBlack,
                                fontSize: AppHelper.setMultiDeviceSize(18.sp, 18.sp),
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                text: state.notificationDataEntity.notificationsDetailEntity?[index].content,
                                color: AppColor.colorMainBlack,
                                fontSize: AppHelper.setMultiDeviceSize(16.sp, 14.sp),
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.notificationDataEntity.notificationsDetailEntity?.length ?? 0,
                  ),
                )
              : (state is GetListNotificationLoading)
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 8.h,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: AppColor.colorMainWhite,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: 8, // số lượng items mà bạn muốn hiển thị khi shimmer
                      ),
                    )
                  : Center(
                      child: TextWidget(
                        text: S.of(context).noData,
                        color: AppColor.colorMainBlack,
                        fontSize: AppHelper.setMultiDeviceSize(18.sp, 18.sp),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    );
        },
      ),
    );
  }
}
