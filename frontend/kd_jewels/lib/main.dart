import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'features/for_user/login_register_screen/presentation/bloc/login_register_bloc/login_register_bloc.dart';
import 'features/splash_screen/presentation/bloc/app_loader_bloc.dart';
import 'features/splash_screen/presentation/page/splash/splash_page.dart';
import 'core/constants/app_colors.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/app_loader.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/app_theme.dart';
import 'di/injector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection().init();
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>  ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return const MyApp();
          },
        ),
      ),

  );
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NoScreenshot noScreenshot = NoScreenshot();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    _blockScreenshots();
    super.initState();
  }

  Future<void> _blockScreenshots() async {
    await noScreenshot.screenshotOff();
  }

  @override
  void dispose() {
    noScreenshot.screenshotOn();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLoaderBloc>(create: (_) => AppLoaderBloc()),
        BlocProvider<LoginRegisterBloc>(create: (_) => LoginRegisterBloc(loginRegisterUseCase: sl())),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: AppStrings.kdJewels,
            theme: AppTheme.lightTheme,
            home: SplashPage(),
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
