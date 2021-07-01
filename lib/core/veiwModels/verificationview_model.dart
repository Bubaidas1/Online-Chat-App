import 'package:chat/core/constants/route_paths.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class VerificationViewModel extends BaseModel {
  NavigationService _navigationService = locator<NavigationService>();

  Future verifySMS(
      {String field1, String field2, String field3, String field4}) async {
    _navigationService.navigatorKey.currentState
        .pushReplacementNamed(Routes.HOME_SCREEN);
  }
}
