import 'package:chat/core/services/authentication_service.dart';
import 'package:chat/core/services/chat_service.dart';
import 'package:chat/core/services/community_service.dart';
import 'package:chat/core/services/dialog_service.dart';
import 'package:chat/core/services/group_service.dart';
import 'package:chat/core/services/navigator_service.dart';
import 'package:chat/core/services/news_service.dart';
import 'package:chat/core/services/user_service.dart';
import 'package:chat/core/utils/random_string.dart';
import 'package:chat/core/veiwModels/addview_model.dart';
import 'package:chat/core/veiwModels/chatscreenview_model.dart';
import 'package:chat/core/veiwModels/chatview_model.dart';
import 'package:chat/core/veiwModels/conversationview_model.dart';
import 'package:chat/core/veiwModels/createview_model.dart';
import 'package:chat/core/veiwModels/feedsview_model.dart';
import 'package:chat/core/veiwModels/forgotpasswordview_model.dart';
import 'package:chat/core/veiwModels/gettingstartedview_model.dart';
import 'package:chat/core/veiwModels/groupview_model.dart';
import 'package:chat/core/veiwModels/homeview_model.dart';
import 'package:chat/core/veiwModels/profileview_model.dart';
import 'package:chat/core/veiwModels/settingsview_model.dart';
import 'package:chat/core/veiwModels/signInViewModel.dart';
import 'package:chat/core/veiwModels/signUpViewModel.dart';
import 'package:chat/core/veiwModels/startupview_model.dart';
import 'package:chat/core/veiwModels/verificationview_model.dart';
import 'package:chat/core/veiwModels/webview_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  // Register Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => GettingStartedViewModel());
  locator.registerLazySingleton(() => SignInViewModel());
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerLazySingleton(() => VerificationViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => FeedsViewModel());
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => AddViewModel());
  locator.registerLazySingleton(() => ForgotPasswordViewModel());
  locator.registerLazySingleton(() => CreateViewModel());
  locator.registerLazySingleton(() => NewsService());
  locator.registerLazySingleton(() => ProfileViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
  locator.registerLazySingleton(() => WebViewModel());
  locator.registerLazySingleton(() => GroupService());
  locator.registerLazySingleton(() => GroupViewModel());
  locator.registerLazySingleton(() => GenerateRandomString());
  locator.registerLazySingleton(() => CommunityService());
  locator.registerLazySingleton(() => SignUpViewModel());
  locator.registerLazySingleton(() => ConversationViewModel());
  locator.registerLazySingleton(() => ChatScreenViewModel());
  locator.registerLazySingleton(() => ChatService());

}

