import 'package:flutter/material.dart';
import 'filter_selector.dart'; // pastikan kamu punya file ini

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  final void Function(Color color) onFilterChanged;

  const PhotoFilterCarousel({
    super.key,
    required this.onFilterChanged,
  });

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.transparent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.purpleAccent,
  ];

  final _filterColor = ValueNotifier<Color>(Colors.transparent);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
    widget.onFilterChanged(value); // kirim ke parent (main.dart)
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          // preview dummy (tidak digunakan karena foto ada di main.dart)
          Positioned.fill(
            child: Container(color: Colors.black),
          ),
          // widget filter selector di bawah
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: FilterSelector(
              filters: _filters,
              onFilterChanged: _onFilterChanged,
            ),
          ),
        ],
      ),
    );
  }
}
