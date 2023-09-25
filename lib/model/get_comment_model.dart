class GetCommentModel {
    GetCommentModel({
        required this.status,
        required this.comments,
    });

    final String? status;
    final List<Comment> comments;

    GetCommentModel copyWith({
        String? status,
        List<Comment>? comments,
    }) {
        return GetCommentModel(
            status: status ?? this.status,
            comments: comments ?? this.comments,
        );
    }

    factory GetCommentModel.fromJson(Map<String, dynamic> json){ 
        return GetCommentModel(
            status: json["status"],
            comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "comments": comments.map((x) => x.toJson()).toList(),
    };

    @override
    String toString(){
        return "$status, $comments, ";
    }
}

class Comment {
    Comment({
        required this.id,
        required this.body,
        required this.eventId,
        required this.userId,
    });

    final String? id;
    final String? body;
    final String? eventId;
    final String? userId;

    Comment copyWith({
        String? id,
        String? body,
        String? eventId,
        String? userId,
    }) {
        return Comment(
            id: id ?? this.id,
            body: body ?? this.body,
            eventId: eventId ?? this.eventId,
            userId: userId ?? this.userId,
        );
    }

    factory Comment.fromJson(Map<String, dynamic> json){ 
        return Comment(
            id: json["id"],
            body: json["body"],
            eventId: json["event_id"],
            userId: json["user_id"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "event_id": eventId,
        "user_id": userId,
    };

    @override
    String toString(){
        return "$id, $body, $eventId, $userId, ";
    }
}
