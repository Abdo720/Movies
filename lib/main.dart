import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/core/CachHelper/SharedPreferences.dart';
import 'package:movies/core/net/internet_checker.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/di.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/user_hive_model.dart';
import 'package:movies/features/main_Layout/Home/data/models/movie_hive_model.dart';
import 'package:movies/features/moviesDetails/data/models/movie_details_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveModelAdapter());
  Hive.registerAdapter(MovieDetailsHiveModelAdapter());
  Hive.registerAdapter(UserHiveModelAdapter());

  configureDependencies();

  getIt<InternetConnectivity>().initialize();

  await Firebase.initializeApp();
  await Sharedpreferences.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: AppRoutes.splash,
        );
      },
    );
  }
}
