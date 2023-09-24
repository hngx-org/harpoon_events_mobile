import 'event_model.dart';

class GroupModel {
  final String id;
  final String title;
  List<EventModel>? events;

  GroupModel({
    required this.id,
    required this.title,
    this.events,
  });

  GroupModel.singleFromJson(Map<String, dynamic> json)
      : id = json['group']['id'],
        title = json['group']['title'] ?? 'Title',
        events = json['events'] == null
            ? []
            : (json['events'] as List).isEmpty
                ? []
                : (json['events'] as List)
                    .map((event) =>
                        EventModel.fromJson(event as Map<String, dynamic>))
                    .toList();

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
