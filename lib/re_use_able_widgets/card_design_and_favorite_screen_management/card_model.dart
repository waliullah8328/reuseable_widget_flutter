// Card Model to represent each card's data
class CardModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final String discountPercentage;

  CardModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
  });
}
