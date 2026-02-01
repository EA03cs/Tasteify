import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Categories/ViewModel/cubit/categories_cubit.dart';
import 'package:tasteify/Feature/splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          locale: const Locale('ar', 'EG'),
          supportedLocales: const [
            Locale('ar', 'EG'),
            Locale('ar'),
          ],

          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },

          home: const SplashScreen(),
        ),
      ),
    );
  }
}