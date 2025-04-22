class Product {
  final String name;
  final String price;
  final String discount;
  final double rating;
  final int reviews;
  final String imageUrl;
  final bool isOutOfStock;

  Product({
    required this.name,
    required this.price,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    this.isOutOfStock = false,
  });
}

final List<Product> products = [
  Product(
    name: 'Allen Solly Regular fit cotton shirt',
    price: '\$35',
    discount: '15% OFF',
    rating: 4.3,
    reviews: 41,
    imageUrl: 'https://via.placeholder.com/150', // Replace with actual image URL
  ),
  Product(
    name: 'Calvin Clein Regular fit slim fit shirt',
    price: '\$52',
    discount: '20% OFF',
    rating: 4.1,
    reviews: 837,
    imageUrl: 'https://via.placeholder.com/150',
    isOutOfStock: true,
  ),
  Product(
    name: 'H&M Regular fit cotton shirt',
    price: '\$59',
    discount: '20% OFF',
    rating: 4.3,
    reviews: 41,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    name: 'Calvin Clein Regular fit casual shirt',
    price: '\$60',
    discount: '25% OFF',
    rating: 4.8,
    reviews: 692,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];