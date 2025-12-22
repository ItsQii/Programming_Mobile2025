class Item {
  final String name;
  final int price;
  final String image;   // path atau URL gambar
  final int stock;
  final double rating;

  const Item({
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
    required this.rating,
  });
}
