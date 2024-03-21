import 'package:bookapi_task/providers/homeProvider.dart';
import 'package:bookapi_task/utilites/appRoutes.dart';
import 'package:bookapi_task/view/homeScreen.dart';
import 'package:bookapi_task/view/welcomeScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'network/dio.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Dio dio = createDio();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(dio: dio),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: WelcomeScreen(),
      //onGenerateRoute: onGenerateRoute,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.welcome: (context) => const WelcomeScreen(),
      },
    );
  }

}
