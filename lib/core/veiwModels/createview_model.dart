import 'package:chat/core/constants/route_paths.dart';
import 'package:chat/core/enum/chat_type.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class CreateViewModel extends BaseModel {
  NavigationService _navigationService = locator<NavigationService>();

  bool _isSearchActive = false;

  bool get isSearch => _isSearchActive;

  void raiseSearch() {
    _isSearchActive = true;
    notifyListeners();
  }

  void dropSearch() {
    _isSearchActive = false;
    notifyListeners();
  }

  void navigateToAddScreen({ChatType category}) {
    String typeX;

    switch (category) {
      case ChatType.Group:
        typeX = 'Group';
        break;
      case ChatType.Community:
        typeX = 'Community';
        break;
      case ChatType.Channel:
        typeX = 'Channel';
        break;
      default:
        typeX = 'Group';
        break;
    }
    _navigationService.navigatorKey.currentState
        .pushReplacementNamed(Routes.ADD_GROUP_SCREEN, arguments: typeX);
  }

  void navigateBack() {
    _navigationService.goBack();
  }
}
