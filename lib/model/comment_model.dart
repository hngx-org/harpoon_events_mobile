class CommentModel {
  final String id;
  final String body;
  final String userId;

  CommentModel({required this.id, required this.body, required this.userId});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        body: json['body'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['user_id'] = userId;

    return data;
  }
}
