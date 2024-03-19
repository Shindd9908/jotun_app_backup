import "package:jotub_app/features/authentication/data/models/user_login_response.dart";
import "package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart";

extension SignInCheckExt on UserLoginResponse {
  UserInfoEntity get userInfoEntity => UserInfoEntity(
        userId: userId,
        username: username,
        userCompany: userCompany,
        userMCCode: userMCCode,
        saleId: saleId,
        saleName: saleName,
        groupId: groupId,
        accessToken: accessToken,
        name: name,
      );
}
