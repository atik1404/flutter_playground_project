import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/core/router/app_router.dart';
import 'package:playground_flutter_project/designsystem/theme/app_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: AppThemeData.light(),
          darkTheme: AppThemeData.dark(),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
