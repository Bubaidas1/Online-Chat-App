import 'package:chat/core/enum/view_state.dart';
import 'package:chat/core/models/user.dart';
import 'package:chat/core/services/authentication_service.dart';
import 'package:chat/core/services/dialog_service.dart';
import 'package:chat/core/services/user_service.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class ProfileViewModel extends BaseModel {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  UserService _userService = locator<UserService>();
  DialogService _dialogService = locator<DialogService>();

  String get fullName => _authenticationService.currentUser.fullName;

  String get email => _authenticationService.currentUser.email;

  String get phone => _authenticationService.currentUser.phone;

  String get id => _authenticationService.currentUser.id;

  // Just if it's not yet set
  String get quote => _authenticationService.currentUser.quote;

  Future updateProfile(
      {String fullName, String email, String phone, String quote}) async {
    setState(ViewState.Busy);

    var result = await _userService.updateUser(AppUser(
        id: _authenticationService.currentUser.id,
        fullName: fullName,
        email: email,
        phone: phone,
        quote: quote));

    setState(ViewState.Idle);

    if (result is bool) {
      _dialogService.showDialog(
          title: "Success",
          buttonTitle: "Ok",
          description: "Profile updated successfully.");
    } else {
      _dialogService.showDialog(
          title: "Error",
          buttonTitle: "Ok",
          description: "Profile update failed. Try again later");
    }
  }
}
