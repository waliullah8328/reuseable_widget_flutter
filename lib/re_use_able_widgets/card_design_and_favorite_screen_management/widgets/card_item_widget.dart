// Widget to represent each card in the main screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../card_controller.dart';

class CardItem extends StatelessWidget {
  final int index;
  final controller = Get.put(CardController());

  CardItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final card = controller.cards[index]; // Get the card data

    return Container(
      width: 270, // Fixed width for the card
      height: 320, // Fixed height for the card
      margin: const EdgeInsets.only(right: 8.0), // Space between cards
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to show image with percentage label and favorite icon
            Stack(
              children: [
                // Image at the top
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    card.imageUrl, // Use the card's image URL
                    width: double.infinity,
                    height: 120, // Fixed height for the image
                    fit: BoxFit.cover,
                  ),
                ),

                // Discount Percentage Positioned at the top-left corner
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      card.discountPercentage, // Use the card's discount percentage
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Favorite Icon Positioned at the top-right corner
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(() {
                    // Use Obx to rebuild this part when favorites change
                    return IconButton(
                      icon: Icon(
                        controller.favorites[index] ? Icons.favorite : Icons.favorite_border,
                        color: controller.favorites[index] ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        // Toggle favorite status when pressed
                        controller.toggleFavorite(index);
                      },
                    );
                  }),
                ),
              ],
            ),

            // Padding for text content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    card.title, // Use the card's title
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),

                  // Subtitle
                  Text(
                    card.subtitle, // Use the card's subtitle
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),

                  // Price and Discount Price
                  Row(
                    children: [
                      // Original Price (Strikethrough)
                      Text(
                        '\$${card.originalPrice.toStringAsFixed(2)}', // Use the card's original price
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough, // Strikethrough
                        ),
                      ),
                      SizedBox(width: 8),

                      // Discounted Price
                      Text(
                        '\$${card.discountedPrice.toStringAsFixed(2)}', // Use the card's discounted price
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Ratings (5 stars example)
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Button at the bottom
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    print('Details clicked for Card ${index + 1}');
                  },
                  child: Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}