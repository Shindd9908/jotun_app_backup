import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotub_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/content_popup_yet_event_time_widget.dart';
import 'package:jotub_app/features/home/presentation/ui/widgets/feature_item.dart';
import 'package:jotub_app/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:jotub_app/generated/l10n.dart';
import 'package:jotub_app/theme/assets.dart';
import 'package:jotub_app/theme/colors.dart';
import 'package:jotub_app/utils/constants/constants.dart';
import 'package:jotub_app/utils/global_widgets/cache_image_widget.dart';
import 'package:jotub_app/utils/global_widgets/popup_dialog_alert.dart';
import 'package:jotub_app/utils/global_widgets/screen_frame.dart';
import 'package:jotub_app/utils/global_widgets/spinkit_loading_widget.dart';
import 'package:jotub_app/utils/global_widgets/text_widget.dart';
import 'package:jotub_app/utils/helpers/helpers.dart';
import 'package:jotub_app/utils/routers/paths.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const FetchListBannerEvent());
      context.read<HomeBloc>().add(const FetchUserProfileEvent());
      context.read<JourneyBloc>().add(FetchListAreaEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppHelper.setMultiDeviceSize(24, 24), horizontal: AppHelper.setMultiDeviceSize(32, 32)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) => current is FetchUserProfileLoadingState || current is FetchUserProfileSuccessState || current is FetchUserProfileFailState,
                    builder: (context, state) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              AppPaths.profileScreen,
                              arguments: {'userInfo': state is FetchUserProfileSuccessState ? state.userInfo : null},
                            ),
                            child: state is FetchUserProfileSuccessState && state.userInfo.avatar != null && state.userInfo.avatar!.isNotEmpty
                                ? CacheImageWidget(
                                    imageUrl: state.userInfo.avatar,
                                    widthImage: AppHelper.setMultiDeviceSize(32, 32),
                                    heightImage: AppHelper.setMultiDeviceSize(32, 32),
                                    radius: 100,
                                  )
                                : Image.asset(AppAssets.iconAvatar, width: AppHelper.setMultiDeviceSize(32, 32)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    AppPaths.profileScreen,
                                    arguments: {'userInfo': state is FetchUserProfileSuccessState ? state.userInfo : null},
                                  ),
                                  child: TextWidget(
                                    text: state is FetchUserProfileSuccessState ? state.userInfo.name : '',
                                    color: AppColor.colorMainWhite,
                                    fontSize: AppHelper.setMultiDeviceSize(18.sp, 14.sp),
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                TextWidget(
                                  text: '${S.of(context).group} ${state is FetchUserProfileSuccessState ? state.userInfo.groupId.toString() : ''}',
                                  color: AppColor.colorMainYellow,
                                  fontSize: AppHelper.setMultiDeviceSize(14.sp, 11.sp),
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(AppPaths.listNotificationScreen),
                    child: Image.asset(
                      AppAssets.iconNotification,
                      width: AppHelper.setMultiDeviceSize(32, 32),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is FetchListBannerSuccessState || current is FetchListBannerFailState || current is FetchListBannerLoadingState,
              builder: (context, state) {
                return state is FetchListBannerLoadingState
                    ? SizedBox(
                        width: 100.w - 32,
                        height: AppHelper.setMultiDeviceSize(14.h, 20.h),
                        child: const SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: 36),
                      )
                    : state is FetchListBannerSuccessState && state.listBanner.isNotEmpty
                        ? CarouselSlider(
                            options: CarouselOptions(height: AppHelper.setMultiDeviceSize(12.h, 20.h), viewportFraction: 1),
                            items: state.listBanner
                                .map(
                                  (el) => CacheImageWidget(
                                    imageUrl: el.bannerURL,
                                    widthImage: 100.w - 32,
                                    heightImage: AppHelper.setMultiDeviceSize(12.h, 20.h),
                                    fit: BoxFit.cover,
                                    radius: 8,
                                  ),
                                )
                                .toList(),
                          )
                        : Image.asset(
                            AppAssets.imgBanner,
                            width: 100.w - 32,
                            height: AppHelper.setMultiDeviceSize(12.h, 20.h),
                          );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: S.of(context).incomingEvent,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  BlocConsumer<JourneyBloc, JourneyState>(
                    listenWhen: (previous, current) => current is FetchListAreaSuccessState,
                    listener: (context, state) {
                      if (state is FetchListAreaSuccessState && state.listArea.isNotEmpty) {
                        context.read<JourneyBloc>().add(FetchAreaHasTripSameTimeWithNowEvent(listAllArea: state.listArea));
                      }
                    },
                    buildWhen: (previous, current) => current is FetchListAreaFailState || current is FetchAreaHasTripSameTimeWithNowState,
                    builder: (context, state) {
                      return state is FetchAreaHasTripSameTimeWithNowState
                          ? Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(state.area!.trip!.image!), fit: BoxFit.cover, opacity: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: 2, color: AppColor.colorMainWhite),
                              ),
                              child: state.area != null
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
                                          child: TextWidget(
                                            text: state.area?.trip?.title ?? '',
                                            color: AppColor.colorMainYellow,
                                            fontSize: AppHelper.setMultiDeviceSize(16.sp, 12.sp),
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        if (state.area?.trip?.schedules != null && state.area!.trip!.schedules!.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(AppAssets.iconCalendar, width: 20, height: 20),
                                                    TextWidget(
                                                      text: state.area!.trip!.schedules!.first.timeStart ?? '',
                                                      color: AppColor.colorMainWhite,
                                                      fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(AppAssets.iconGlobal, width: 20, height: 20),
                                                    TextWidget(
                                                      text: state.area!.trip!.schedules!.first.address ?? '',
                                                      color: AppColor.colorMainWhite,
                                                      fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.only(top: state.area?.trip?.schedules != null && state.area!.trip!.schedules!.isNotEmpty ? 0 : 20),
                                          child: TextWidget(
                                            text: 'Yêu cầu sự kiện: Lễ phục, trang phục dự tiệc',
                                            color: AppColor.colorMainWhite,
                                            fontSize: AppHelper.setMultiDeviceSize(19.sp, 10.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20, right: 4, bottom: 2),
                                            child: GestureDetector(
                                              onTap: () => Navigator.of(context).pushNamed(
                                                AppPaths.scheduleScreen,
                                                arguments: {'trip': state.area!.trip, 'tripIndex': state.tripIndex},
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextWidget(
                                                    text: S.of(context).goToDetailTrip,
                                                    color: AppColor.colorMainYellow,
                                                    fontSize: AppHelper.setMultiDeviceSize(19.sp, 10.sp),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xffF19F3B),
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      height: AppHelper.setMultiDeviceSize(150, 150),
                                      child: TextWidget(
                                        text: S.of(context).noData,
                                        color: AppColor.colorMainWhite,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            )
                          : state is FetchListAreaFailState
                              ? Container(
                                  alignment: Alignment.center,
                                  height: AppHelper.setMultiDeviceSize(150, 150),
                                  decoration: BoxDecoration(
                                    color: AppColor.colorMainBlack,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(width: 2, color: AppColor.colorMainWhite),
                                  ),
                                  child: TextWidget(
                                    text: S.of(context).noData,
                                    color: AppColor.colorMainWhite,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : SpinKitLoadingWidget(color: AppColor.colorMainWhite, size: AppHelper.setMultiDeviceSize(32, 32));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: S.of(context).feature,
                        color: AppColor.colorMainWhite,
                        fontSize: AppHelper.setMultiDeviceSize(14.sp, 10.sp),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    runSpacing: 24,
                    children: Constants.getListFeatureHomePage(context)
                        .map(
                          (el) => SizedBox(
                            width: (100.w - 64) / 3,
                            child: GestureDetector(
                              onTap: () => el['featureName'] == S.of(context).newProductInformation && DateTime.now().isBefore(DateTime.parse('2024-05-08 18:00:00'))
                                  ? PopupDialogAlert.showPopupWithUIParamHasBell(context, const ContentPopupYetEventTimeWidget())
                                  : Navigator.of(context).pushNamed(el['pathScreenNavigateOnTap']),
                              child: FeatureItem(
                                title: el['featureName'],
                                iconAsset: el['pathIcon'],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
