class Place {
  final int id;
  final String name;
  final double rating;
  final String imageUrl;

  Place({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
  });


  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      rating: double.parse(json['rating']),
      imageUrl: json['imageUrl'],
    );
  }
}
