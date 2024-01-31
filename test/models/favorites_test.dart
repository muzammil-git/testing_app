import 'package:fitness_app/models/favorites_provider.dart';
import 'package:test/test.dart';

void main() {

  /// Unit testing the provider :  A unit test verifies that every individual unit of software, be it a function, object or a widget, performs its intended task correctly.
  group('Unit Testing App Provider', () {
    var favorites = FavoritesProvider();
    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('The item should be deleted', () {
      var number = 35;
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });




}