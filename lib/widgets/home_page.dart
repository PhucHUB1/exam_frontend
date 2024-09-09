import 'package:flutter/material.dart';

import '../service/api_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  List<dynamic> _places = [];

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  void _fetchPlaces() async {
    try {
      List<dynamic> places = await _apiService.getAllPlaces();
      setState(() {
        _places = places;
      });
    } catch (e) {
      print('Error fetching places: $e');
    }
  }


  void _ratePlace(int placeId, int rating) async {
    try {
      await _apiService.ratePlace(placeId, 1, rating); // Example userId = 1
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully rated the place!'),
      ));
      _fetchPlaces();
    } catch (e) {
      print('Error rating place: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Guy! Where are you going next?'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _places.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _places.length,
              itemBuilder: (context, index) {
                final place = _places[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(place['name']),
                    subtitle: Text('Rating: ${place['averageRating']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {
                        _ratePlace(place['id'], 1);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}