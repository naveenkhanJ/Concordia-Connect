import 'package:atg/features/Notification/notification_page.dart';
import 'package:atg/features/home/pages/home_page.dart';
import 'package:atg/features/login/login_page.dart';
import 'package:atg/features/onboarding/onboarding.dart';
import 'package:atg/features/splash/splash_page.dart';
import 'package:atg/features/spaces/space_page.dart';
import 'package:atg/features/tasks/task_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorkSpace',
      theme: ThemeData(
        primaryColor: const Color(0xFF0065B3),
        scaffoldBackgroundColor: const Color(0xFFF8FAFB),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),

      // Start with Splash Screen
      home: const SplashScreen(),

      // Named routes for easier navigation
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const EliteDashboardView(),
        '/spaces': (context) => const SpacePage(),
        '/tasks': (context) => const TaskManagementPage(),
        '/notifications': (context) => const NotificationsPage(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      },
    );
  }
}
