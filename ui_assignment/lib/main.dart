import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_assignment/screens/home_screen.dart';
import 'package:ui_assignment/utils/custom_assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(
            context,
          ).textTheme.apply(fontFamily: CustomFontFamily.MANROPE),
        ),
        title: "UI Assignment",
        home: HomeScreen(),
      ),
    );
  }
}
