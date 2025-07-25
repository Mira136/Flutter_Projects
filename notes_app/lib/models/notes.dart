class Note {
  String id;
  String title;
  String description;
  Note({required this.id, required this.title, required this.description});
  // Convert a Note object to a Map (for JSON encoding)
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
  };

  // Create a Note object from a Map (for JSON decoding)
  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    title: json['title'],
    description: json['description'],
  );
}
