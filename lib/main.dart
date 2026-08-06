import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/specializations_screen.dart';
import 'screens/holland_test_screen.dart';
import 'screens/math_test_screen.dart';
import 'screens/success_stories_screen.dart';
import 'screens/teachers_screen.dart';
import 'screens/parents_screen.dart';

void main() {
  runApp(const BtecApp());
}

class BtecApp extends StatelessWidget {
  const BtecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دليل BTEC',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/specializations': (context) => const SpecializationsScreen(),
        '/holland': (context) => const HollandTestScreen(),
        '/math': (context) => const MathTestScreen(),
        '/stories': (context) => const SuccessStoriesScreen(),
        '/teachers': (context) => const TeachersScreen(),
        '/parents': (context) => const ParentsScreen(),
      },
    );
  }
}
