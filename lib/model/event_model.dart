class EventModel {
  final String id;
  final String title;
  final String description;
  final String creatorId;
  final String location;
  final String startTime;
  final String endTime;
  final String startDate;
  final String endDate;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.creatorId,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json['id'],
        title: json['title'] ?? 'Title',
        description: json['description'] ?? 'Description',
        creatorId: json['creator_id'] ?? 'Creator',
        location: json['location'] ?? 'Location',
        startTime: json['start_time'] ?? '00:00:00',
        endTime: json['end_time'] ?? '00:00:00',
        startDate: json['start_date'] ?? '01/01/2023',
        endDate: json['end_date'] ?? '01/01/2023',
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['creator_id'] = creatorId;
    data['location'] = location;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['start_date'] = startDate;
    data['end_date'] = endDate;

    return data;
  }
}
