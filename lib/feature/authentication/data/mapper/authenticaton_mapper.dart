import "package:jotub_app/feature/authentication/data/models/login_response.dart";
import "package:jotub_app/feature/authentication/domain/entities/user_authentication_entity.dart";

extension SignInCheckExt on LoginResponse {
  UserInfoEntity get userInfoEntity => UserInfoEntity(
    id: userModel!.id,
    code: userModel!.code,
    userTypeID: userModel!.userTypeID,
    name: userModel!.name,
    kanaName: userModel!.kanaName,
    representativeName: userModel!.representativeName,
    representativeKanaName: userModel!.representativeKanaName,
    email: userModel!.email,
    secondEmail: userModel!.secondEmail,
    address: userModel!.address,
    postalCode: userModel!.postalCode,
    personInChargeName: userModel!.personInChargeName,
    personInChargeKanaName: userModel!.personInChargeKanaName,
    personInChargePhone: userModel!.personInChargePhone,
    personInChargeEmail: userModel!.personInChargeEmail,
    isInstallationAddress: userModel!.isInstallationAddress,
    installationAddress: userModel!.installationAddress,
    isMovingHouse: userModel!.isMovingHouse,
    note: userModel!.note,
    hasClaim: userModel!.hasClaim,
    claimMsg: userModel!.claimMsg,
    locale: userModel!.locale,
    isPushNotification: userModel!.isPushNotification,
    createdBy: userModel!.createdBy,
    accessToken: accessToken,
    phone: userModel!.phone,
  );
}