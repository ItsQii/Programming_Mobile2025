import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

// import semua widget yang kamu buat
import 'widget/takepicture_screen.dart';
import 'widget/displaypicture_screen.dart';
import 'widget/filter_carousel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar kamera yang tersedia
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  // Jalankan aplikasi utama
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TakeAndFilterScreen(camera: firstCamera),
    ),
  );
}

/// Widget utama yang menggabungkan kamera dan filter
class TakeAndFilterScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakeAndFilterScreen({super.key, required this.camera});

  @override
  State<TakeAndFilterScreen> createState() => _TakeAndFilterScreenState();
}

class _TakeAndFilterScreenState extends State<TakeAndFilterScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String? _capturedImagePath;
  Color _selectedFilter = Colors.transparent; // filter awal

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ambil foto dan simpan path
  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        _capturedImagePath = image.path;
      });
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera + Filter')),
      body: Column(
        children: [
          // Jika belum ambil foto, tampilkan kamera
          if (_capturedImagePath == null)
            Expanded(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          else
          // Jika sudah ambil foto, tampilkan hasil foto dengan filter
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(File(_capturedImagePath!), fit: BoxFit.cover),
                  Container(color: _selectedFilter.withOpacity(0.3)),
                ],
              ),
            ),

          // Widget filter carousel di bawah
          if (_capturedImagePath != null)
            SizedBox(
              height: 200,
              child: PhotoFilterCarousel(
                onFilterChanged: (color) {
                  setState(() {
                    _selectedFilter = color;
                  });
                },
              ),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        tooltip: 'Ambil Foto',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
