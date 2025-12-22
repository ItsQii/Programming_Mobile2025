import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

      Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Wisata Danau Ranu Kumbolo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Batu, Malang, Indonesia',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red),
            const Text('41'),
          ],
        ),
      );

      Color color = Theme.of(context).primaryColor;

      Widget buttonSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      );

      Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Ranu Kumbolo adalah danau air tawar yang indah dan populer di dalam Taman Nasional Bromo Tengger Semeru Jawa Timur,'
              ' Terletak di ketinggian sekitar 2.400 mdpl, danau ini menjadi pos transit utama sebelum melanjutkan pendakian ke puncak Mahameru. '
              'Ahmad Rifqi Hendriansyah - 2341720134.',
          softWrap: true,
        ),
      );

      return MaterialApp(
        title: 'Flutter layout: Nama dan NIM Anda',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Vacation'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/RanuKumbolo.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          ),
        ),
      );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

