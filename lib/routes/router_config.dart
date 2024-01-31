import 'package:fitness_app/screens/favorites.dart';
import 'package:fitness_app/screens/landing_page.dart';
import 'package:fitness_app/screens/premium_screen.dart';
import 'package:fitness_app/screens/setting_screen.dart';
import 'package:fitness_app/services/dialog_manager.dart';
import 'package:fitness_app/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/login_provider.dart';
import '../screens/login_page.dart';
import '../screens/onboarding/onboarding_screens.dart';

// GoRouter configuration

final router = GoRouter(
  navigatorKey: DialogManager().getNavigatorKey(),
  redirect: (context, state){

    print("State Location: ${state.location}");

    SharedPreferencesHelper sharedPrefs = SharedPreferencesHelper();

    final loggedIn = Provider.of<LoginProvider>(context, listen: false).isLoggedIn;
    final isLoginScreen = state.location == "/login";
    final isOnboarding = sharedPrefs.getShowOnboarding();

    // if(!loggedIn) return '/login';
    if(isOnboarding) {
      return '/onboarding';
    }

    else if(loggedIn && isLoginScreen) {
      return '/';
    }

    else if(state.location == "/premium" && !loggedIn) {
      return '/login';
    }

    else if(!loggedIn && !isLoginScreen) {
      return '/login';
    }

    print("Going for null");
    return null;
  },
  // refreshListenable: Provider.of<LoginProvider>(context).isLoggedIn,

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),

    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingPage(),
    ),

    GoRoute(
      path: '/premium',
      builder: (context, state) => const PremiumScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),

    GoRoute(
      path: '/favorites',
      builder: (context, state) => FavoritesPage(),
    ),
  ],

  errorBuilder: (context, state){
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: const Center(
          child: Text("Error Page"),
        ),
      ),
    );
  },

);

