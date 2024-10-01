import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reuseable_widget_flutter/re_use_able_widgets/card_design_and_favorite_screen_management/card_controller.dart';

import '../widgets/card_item_widget.dart';
import 'favorite_sceeen.dart';


class HorizontalCardDemo extends StatelessWidget {
  final controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Card List Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.to(FavoritesScreen()); // Navigate to Favorites Screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
            itemCount: controller.cards.length, // Number of cards
            itemBuilder: (context, index) {
              return CardItem(index: index); // Create a card for each index
            },
          ),
        ),
      ),
    );
  }
}