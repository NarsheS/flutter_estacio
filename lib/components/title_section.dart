import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rating;

  const TitleSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Text(subtitle, style: TextStyle(color: Colors.grey[500])),
                  ],
                ),
              ],
            ),
          ),
          Text(rating),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}