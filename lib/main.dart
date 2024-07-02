import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/configs/configs.dart';
import 'src/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized().then(
    (_) {
      runApp(
        EasyLocalization(
          path: AppLocale.path,
          supportedLocales: AppLocale.supportedLocaleList,
          startLocale: AppLocale.startLocale,
          fallbackLocale: AppLocale.fallbackLocale,
          child: const MainApp(),
        ),
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(448, 997),
      builder: (context, _) {
        return MaterialApp.router(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
          theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: ColorAssets.kCelestialBlue,
                  ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                backgroundColor: ColorAssets.kCelestialBlue,
              ))),
        );
      },
    );
  }
}
