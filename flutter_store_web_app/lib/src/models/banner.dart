import 'dart:convert';

class Banner {
  final String id;
  final String image;

  Banner({required this.id, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['_id'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Banner.fromJson(String source) => Banner.fromMap(json.decode(source));
}
