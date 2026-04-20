import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'features/splash_screen/presentation/page/splash/splash_page.dart';
import 'core/constants/app_colors.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/app_loader.dart';
import 'core/constants/app_strings.dart';
import 'core/constants/app_theme.dart';
import 'di/injector.dart';
import 'features/for_user/home_screen/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection().init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MyApp();
      },
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
        statusBarIconBrightness: Brightness.light,
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
        BlocProvider<HomeBloc>(create: (_) => HomeBloc(homeUseCase: sl())),
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
