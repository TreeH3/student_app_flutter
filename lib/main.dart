import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:student_app/business/services/user_network_service.dart';
import 'package:student_app/implementations/user_network_service_test_impl.dart';
import 'package:student_app/pages/home_page.dart';
import 'package:student_app/pages/login_page.dart';
import 'package:student_app/pages/welcome_page.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserNetworkService>(
      () => UserNetworkServiceTestImpl()
  );
}

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student App",
      home: WelcomePage(),
    );
  }
}
