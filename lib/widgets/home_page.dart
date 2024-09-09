import 'package:exams/widgets/popular_destination.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // For decoding JSON
import 'package:http/http.dart' as http;
import 'categories_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> popularDestinations = [];

  @override
  void initState() {
    super.initState();
    fetchPopularDestinations();
  }


  Future<void> fetchPopularDestinations() async {
    final response = await http.get(Uri.parse('http://<YOUR_API_URL>/getAllPlace'));

    if (response.statusCode == 200) {
      setState(() {
        popularDestinations = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load destinations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Guy!'),
      ),
      body: Column(
        children: [
          SearchBar(), // Search bar widget
          CategoryButtons(), // Widget cho các nút phân loại
          SizedBox(height: 20),
          Expanded(
            child: popularDestinations.isEmpty
                ? Center(child: CircularProgressIndicator())
                : PopularDestinations(destinations: popularDestinations),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
