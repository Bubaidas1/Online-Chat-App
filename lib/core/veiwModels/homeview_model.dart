import 'package:chat/core/constants/route_paths.dart';
import 'package:chat/core/enum/view_state.dart';
import 'package:chat/core/models/user.dart';
import 'package:chat/core/services/authentication_service.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/core/services/user_service.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel{
  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  UserService _userService = locator<UserService>();

  bool _searching = false;

  bool get isSearching => _searching;

  List<AppUser> users = [];

  void startSearching(){
    _searching = true;
    notifyListeners();
  }

  void endSearching(){
    _searching = false;
    notifyListeners();
  }

   void navigateToCreateScreen(){
     _navigationService.navigateTo(Routes.CREATE_SCREEN);
   }

   Future signOut() async{
     setState(ViewState.Busy);
      await _authenticationService.signOut();
      setState(ViewState.Idle);
      _navigationService.navigatorKey.currentState.pushReplacementNamed(Routes.EXIT_SCREEN);
   }
   
   void navigateToProfile(){
     _navigationService.navigateTo(Routes.PROFILE_SCREEN);
   }

   void navigateToSettings(){
     _navigationService.navigateTo(Routes.SETTINGS_SCREEN);
   }

   Future searchForUser ({ String username }) async {
      setState(ViewState.Busy);
      var result = await _userService.searchForUser(username: username);
      setState(ViewState.Idle);

      if(result is AppUser){
        users.clear();
        users.add(result);
        notifyListeners();
      }
   }

  void navigateToChatScreen({ String username, String imageSrc, String userId }){
    _navigationService.navigateTo(Routes.PERSONAL_CHAT_SCREEN, arguments: [username, imageSrc, userId ]);
  }
}