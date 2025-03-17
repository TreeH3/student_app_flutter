import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/pages/user_state.dart';

import '../business/models/authenticate.dart';
import '../business/services/user_network_service.dart';
import '../main.dart';

class UserController extends StateNotifier<UserState>{
  UserController(super.state);

  var userNetworkService = getIt<UserNetworkService>();

  //var data=Authentication(email: emailCtrl.text, password: passwordCtrl.text);
  //var resultat = await userNetworkService.authenticate(data);
}