import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton('Hotels', Icons.hotel),
        _buildCategoryButton('Flights', Icons.flight),
        _buildCategoryButton('All', Icons.all_inclusive),
      ],
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(label),
      ],
    );
  }
}