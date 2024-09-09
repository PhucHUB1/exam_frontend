import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final dynamic destination;

  const DestinationCard({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(destination['imageUrl']),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Container(
            color: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  destination['name'],
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(
                      destination['rating'].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}