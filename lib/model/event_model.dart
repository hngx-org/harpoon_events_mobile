class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.creatorId,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.comments,
    required this.likes,
    required this.thumbnail,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? creatorId;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;
  final List<Comment> comments;
  final List<dynamic> likes;
  final Thumbnail? thumbnail;

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? creatorId,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    String? startTime,
    String? endTime,
    List<Comment>? comments,
    List<dynamic>? likes,
    Thumbnail? thumbnail,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creatorId: creatorId ?? this.creatorId,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      creatorId: json["creator_id"],
      location: json["location"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      startTime: json["start_time"],
      endTime: json["end_time"],
      comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
      likes: json["likes"] == null ? [] : List<dynamic>.from(json["likes"]!.map((x) => x)),
      thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "creator_id": creatorId,
        "location": location,
        "start_date": "$startDate",
        "end_date": "$endDate",
        "start_time": startTime,
        "end_time": endTime,
        "comments": comments.map((x) => x.toJson()).toList(),
        "likes": likes.map((x) => x).toList(),
        "thumbnail": thumbnail?.toJson(),
      };

  @override
  String toString() {
    return "$id, $title, $description, $creatorId, $location, $startDate, $endDate, $startTime, $endTime, $comments, $likes, $thumbnail, ";
  }
}

class Comment {
  Comment({
    required this.id,
    required this.eventId,
    required this.body,
    required this.userId,
  });

  final String? id;
  final String? eventId;
  final String? body;
  final String? userId;

  Comment copyWith({
    String? id,
    String? eventId,
    String? body,
    String? userId,
  }) {
    return Comment(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      body: body ?? this.body,
      userId: userId ?? this.userId,
    );
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      eventId: json["event_id"],
      body: json["body"],
      userId: json["user_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "body": body,
        "user_id": userId,
      };

  @override
  String toString() {
    return "$id, $eventId, $body, $userId, ";
  }
}

class Thumbnail {
  Thumbnail({
    required this.id,
    required this.url,
  });

  final String? id;
  final String? url;

  Thumbnail copyWith({
    String? id,
    String? url,
  }) {
    return Thumbnail(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      id: json["id"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };

  @override
  String toString() {
    return "$id, $url, ";
  }
}
