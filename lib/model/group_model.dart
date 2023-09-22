class GroupModel {
  final String id;
  final String title;

  GroupModel({
    required this.id,
    required this.title,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json['id'],
        title: json['title'] ?? 'Title',
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;

    return data;
  }
}
