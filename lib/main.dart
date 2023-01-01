// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:akm/app/utils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 🌎 Project imports:
import 'app/routes/app_pages.dart';
import 'app/themes/light.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // show push notification
  await FlutterLocalNotificationsPlugin().show(
    message.hashCode,
    message.notification?.title,
    message.notification?.body,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        enableLights: true,
        enableVibration: true,
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
        playSound: true,
        'channel id',
        'channel name',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        icon: '@mipmap/launcher_icon',
      ),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterLocalNotificationsPlugin().initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    ),
  );

  // Initialize firebase

  Get.testMode = true;

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    const MyApp(),
  );

  DependencyInjection.init();

  await firebaseInitialization.then((value) {
    Get.put(LoginPageController());
  });

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  // TODO: - Edit form agunan masih error dan balik lagi ke value awal
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(
            480,
            name: MOBILE,
          ),
          const ResponsiveBreakpoint.autoScale(
            800,
            name: TABLET,
          ),
          const ResponsiveBreakpoint.resize(
            1000,
            name: DESKTOP,
          ),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
      themeMode: ThemeMode.light,
      title: "Analisis Kredit Mikro",
      // initialRoute: AppPages.INITIAL,
      // initialRoute: Routes.LOGIN_PAGE,
      home: const Center(
        child: CircularProgressIndicator(),
      ),
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      locale: const Locale('en'),
    );
  }
}
