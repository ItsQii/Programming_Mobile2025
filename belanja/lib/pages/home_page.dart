import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Black Myth: Wukong',
      price: 899000,
      image: 'images/BMW.jpg',
      stock: 999,
      rating: 9.8,
    ),
    Item(
      name: 'Elden Ring',
      price: 599000,
      image: 'images/ER.jpg',
      stock: 999,
      rating: 9.9,
    ),
    Item(
      name: 'Clair Obscur: Expedition 33',
      price: 899000,
      image: 'images/EXP33.jpg',
      stock: 999,
      rating: 10.0,
    ),
    Item(
      name: 'Ghost of Tsushima',
      price: 799000,
      image: 'images/GOT.jpg',
      stock: 999,
      rating: 9.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          // GridView Expanded
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       // 2 kolom
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,  // tinggi vs lebar card
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/item',
                        arguments: item,
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Gambar dengan Hero dan AspectRatio agar ukuran sama
                          Expanded(
                            child: Hero(
                              tag: item.image,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                child: AspectRatio(
                                  aspectRatio: 1, // kotak
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Info produk
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text('Price: ${item.price}', style: const TextStyle(fontSize: 14)),
                                Text(
                                  item.stock == -1 ? 'Stock: Unlimited' : 'Stock: ${item.stock}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text('Rating: ${item.rating} ⭐', style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.grey[200],
            child: const Text(
              'Ahmad Rifqi Hendriansyah - 2341720134',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
