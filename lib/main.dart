import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:student_app/business/services/user_network_service.dart';
import 'package:student_app/implementations/user_network_service_test_impl.dart';
import 'package:student_app/pages/home_page.dart';
import 'package:student_app/pages/profile_page.dart';
import 'package:student_app/pages/welcome_page.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserNetworkService>(
      () => UserNetworkServiceTestImpl()
  );
}

void main() {
  setup();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student App",
      home: HomePage(),
    );
  }
}
