import 'package:chat/core/constants/route_paths.dart';
import 'package:chat/core/enum/view_state.dart';
import 'package:chat/core/models/feeds.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/core/services/news_service.dart';
import 'package:chat/locator.dart';

import 'base_model.dart';

class FeedsViewModel extends BaseModel {
  // Add the navigator service
  NavigationService _navigationService = locator<NavigationService>();
  NewsService _newsService = locator<NewsService>();

  List<Feeds> feeds;

  Future setFeeds() async {
    //Set the state to busy
    setState(ViewState.Busy);

    feeds = await _newsService.getNews();

    notifyListeners();
    // Set the state back to idle
    setState(ViewState.Idle);
  }

  void navigateToNewsPage(int id) {
    _navigationService.navigatorKey.currentState
        .pushNamed(Routes.WEB_SCREEN, arguments: feeds[id].url);
  }
}
