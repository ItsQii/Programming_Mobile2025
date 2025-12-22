import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data Item dari route arguments
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name), // menampilkan nama item di AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero widget untuk animasi transisi gambar
            Hero(
              tag: item.image, // tag harus sama dengan HomePage
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama item
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Harga
            Text(
              'Price: ${item.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),

            // Stok
            Text(
              item.stock == -1 ? 'Stock: Unlimited' : 'Stock: ${item.stock}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Rating
            Text(
              'Rating: ${item.rating} ⭐',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),

            // Tombol kembali
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
