import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.white2Color,
    scaffoldBackgroundColor: AppColors.white2Color,
    primaryColorLight: AppColors.white2Color,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.white2Color),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(
          color: AppColors.white2Color,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(
          color: AppColors.white2Color,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(
          color: AppColors.white2Color,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.whiteColor,
      //selectionHandleColor: AppColors.colorNeutral5,
    ),
    fontFamily: "Lato",
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      dragHandleColor: AppColors.white2Color,
      dragHandleSize: Size(50.sp, 8.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.sp),
          topRight: Radius.circular(8.sp),
        ),
      ),
      constraints: BoxConstraints(maxHeight: 90.h, minHeight: 25.h),
      backgroundColor: AppColors.white2Color,
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.fill,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.white2Color,
      labelColor: AppColors.white2Color,
      dividerHeight: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.white2Color,
        size: 15.sp,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.white2Color,
        size: 15.sp,
      ),
      selectedItemColor: AppColors.white2Color,
      unselectedItemColor: AppColors.white2Color,
      backgroundColor: AppColors.white2Color,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    splashColor: Colors.transparent,
    dividerColor: AppColors.white2Color,
    dividerTheme: const DividerThemeData(
      color: AppColors.white2Color,
      endIndent: 0,
      space: 0,
      indent: 0,
    ),
    iconTheme: IconThemeData(
      color: AppColors.white2Color,
      size: 14.sp,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: const WidgetStatePropertyAll(AppColors.white2Color),
        iconSize: WidgetStatePropertyAll(14.sp),
      ),
    ),
  );
}
