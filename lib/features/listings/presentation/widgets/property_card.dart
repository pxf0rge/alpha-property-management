import 'package:flutter/material.dart';
import 'property_header.dart';
import 'property_image_slider.dart';
import 'property_details.dart';

class PropertyCard extends StatelessWidget {
  final int index;

  const PropertyCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const PropertyImageSlider(),
                PropertyHeader(index: index),
              ],
            ),
            const PropertyDetails(),
          ],
        ),
      ),
    );
  }
}
