import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/color.dart';

class AccessoriesCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onDelete;
  final bool isAvailable;

  const AccessoriesCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.onDelete,
      required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: cardColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Delete Button
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.delete_outline_rounded),
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ),
        // Product Details
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                isAvailable ? "\u2981 Available" : "\u2981 Unavailable",
                style:
                    TextStyle(color: isAvailable ? Colors.green : Colors.red),
              ),
              SizedBox(height: 4),
              Text(
                "\$$price.00",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}