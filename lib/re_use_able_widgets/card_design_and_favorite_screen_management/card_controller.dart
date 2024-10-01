// Controller to manage favorite state and card data using GetX
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'card_model.dart';

class CardController extends GetxController {
  // Observable variable to track favorite status
  var favorites = List<bool>.generate(10, (_) => false).obs;
  var favoriteItems = <int>[].obs; // List to hold favorite item indices

  // List of card data
  var cards = <CardModel>[
    CardModel(
      title: 'Card Title 1',
      subtitle: 'Card Subtitle 1',
      imageUrl: 'https://via.placeholder.com/200x120',
      originalPrice: 100.0,
      discountedPrice: 80.0,
      discountPercentage: '-20%',
    ),
    CardModel(
      title: 'Card Title 2',
      subtitle: 'Card Subtitle 2',
      imageUrl: 'https://via.placeholder.com/200x120',
      originalPrice: 120.0,
      discountedPrice: 90.0,
      discountPercentage: '-25%',
    ),

    CardModel(
      title: 'Card Title 3',
      subtitle: 'Card Subtitle 3',
      imageUrl: 'https://via.placeholder.com/200x120',
      originalPrice: 120.0,
      discountedPrice: 90.0,
      discountPercentage: '-20%',
    ),
  ].obs; // Make it observable

  void toggleFavorite(int index) {
    favorites[index] = !favorites[index];
    if (favorites[index]) {
      favoriteItems.add(index); // Add to favorites
    } else {
      favoriteItems.remove(index); // Remove from favorites
    }
  }
}