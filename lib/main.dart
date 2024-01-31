import 'package:fitness_app/models/login_provider.dart';
import 'package:fitness_app/routes/router_config.dart';
import 'package:fitness_app/services/connectivity_checker.dart';
import 'package:fitness_app/services/dialog_manager.dart';
import 'package:fitness_app/themes/app_theme.dart';
import 'package:fitness_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'models/favorites_provider.dart';
import 'models/theme_provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  await SharedPreferencesHelper.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load(fileName: ".env");
  ConnectivityManager();

  FlutterNativeSplash.remove();



  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    DialogManager().setNavigatorKey(_navigatorKey);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Update the app's theme based on the device's theme mode.
    //   final brightness = MediaQuery.of(context).platformBrightness == Brightness.dark;
    //   print(brightness);
    //   // without context
    //   // var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    // });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {

            // var height = MediaQuery.of(context).size.height;
            // var brightness = MediaQuery.of(context).platformBrightness == Brightness.dark;
            print("Hitt");

            return MaterialApp.router(
              title: 'Flutter Demo',
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              // theme: true ? AppTheme.darkTheme : AppTheme.lightTheme,
              // themeMode: ThemeMode.system,
              theme: themeProvider.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
              routerConfig: router,
              debugShowCheckedModeBanner: false,
            );
          },
      ),
    );
  }
}
