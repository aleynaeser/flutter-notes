class ToDos {
  int id;
  String name;
  String image;

  ToDos({required this.id, required this.name, required this.image});

  factory ToDos.fromJson(Map<String, dynamic> json) {
    return ToDos(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }
}
