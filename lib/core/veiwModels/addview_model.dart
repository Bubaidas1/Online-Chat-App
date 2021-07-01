import 'package:chat/core/enum/pricing_type.dart';
import 'package:chat/core/enum/view_state.dart';
import 'package:chat/core/enum/visibility.dart';
import 'package:chat/core/models/community.dart';
import 'package:chat/core/models/group.dart';
import 'package:chat/core/services/authentication_service.dart';
import 'package:chat/core/services/community_service.dart';
import 'package:chat/core/services/dialog_service.dart';
import 'package:chat/core/services/group_service.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/core/utils/random_string.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class AddViewModel extends BaseModel {
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  GroupService _groupService = locator<GroupService>();
  CommunityService _communityService = locator<CommunityService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  GenerateRandomString _gen = locator<GenerateRandomString>();

  Privacy _character = Privacy.Private;

  Pricing _pricing = Pricing.Premium;

  Privacy get character => _character;

  Pricing get pricing => _pricing;

  void navigateBack() {
    _navigationService.goBack();
  }

  void setPrivacy(Privacy privacy) {
    _character = privacy;
    notifyListeners();
  }

  void setPricing(Pricing pricing) {
    _pricing = pricing;
    notifyListeners();
  }

  // Add Groups
  Future addGroup({
    String name,
    String description,
    String logo,
  }) async {
    setState(ViewState.Busy);

    var result = await _groupService.createGroup(Group(
      id: _gen.randomString(28),
      name: name,
      description: description,
      users: [_authenticationService.currentUser.id],
      admin: _authenticationService.currentUser.id,
      public: _character == Privacy.Private ? false : true,
      premium: _pricing == Pricing.Premium ? true : false,
      logo: logo,
      groupKey: '',
      groupLink: '',
      price: '0',
    ));

    setState(ViewState.Idle);

    if (result is bool) {
      _dialogService.showDialog(
        title: 'Success',
        description: 'Group created successfully.',
        buttonTitle: 'Ok',
      );
    } else {
      _dialogService.showDialog(
        title: "Error",
        description: result,
        buttonTitle: 'Ok',
      );
    }
  }

  // Add Community
  Future addCommunity({
    String name,
    String description,
    String logo,
  }) async {
    setState(ViewState.Busy);

    var result = await _communityService.createCommunity(Community(
        id: _gen.randomString(28),
        name: name,
        description: description,
        users: [_authenticationService.currentUser.id],
        admin: _authenticationService.currentUser.id,
        logo: logo));

    setState(ViewState.Idle);

    if (result is bool) {
      _dialogService.showDialog(
        title: 'Success',
        description: 'Community created successfully.',
        buttonTitle: 'Ok',
      );
    } else {
      _dialogService.showDialog(
        title: "Error",
        description: result,
        buttonTitle: 'Ok',
      );
    }
  }
}
