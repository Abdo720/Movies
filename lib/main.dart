import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/routes/App_Router.dart';
import 'package:movies/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.beforeOnBoarding,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
