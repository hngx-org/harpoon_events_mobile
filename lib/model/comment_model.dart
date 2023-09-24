class CommentModel {
  final String id;
  final String body;

  CommentModel({required this.id, required this.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        body: json['body'] ?? 'Body',
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;

    return data;
  }
}
