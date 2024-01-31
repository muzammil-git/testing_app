import 'package:fitness_app/models/favorites_provider.dart';
import 'package:fitness_app/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

/// Widget testing : Where you can test each widget in an isolated fashion. This step tests the LandingPage and FavoritesPage screens individually.
Widget createHomeScreen() => ChangeNotifierProvider<FavoritesProvider>(
  create: (context) => FavoritesProvider(),
  child: const MaterialApp(
    home: LandingPage(),
  ),
);

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 6'), findsOneWidget);

      //This scrolls at -500 offset
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -500),
        5000,
      );

      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.text('Item 10'), findsNothing);
    });
  });
}
