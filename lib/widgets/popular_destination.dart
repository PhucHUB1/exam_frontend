import 'package:flutter/material.dart';

import 'destination_card.dart';

class PopularDestinations extends StatelessWidget {
  final List<dynamic> destinations;

  const PopularDestinations({Key? key, required this.destinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        var destination = destinations[index];
        return DestinationCard(destination: destination);
      },
    );
  }
}