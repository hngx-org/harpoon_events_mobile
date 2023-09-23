class GroupListModel {
    GroupListModel({
        required this.status,
        required this.groups,
    });

    final String? status;
    final List<Group> groups;

    GroupListModel copyWith({
        String? status,
        List<Group>? groups,
    }) {
        return GroupListModel(
            status: status ?? this.status,
            groups: groups ?? this.groups,
        );
    }

    factory GroupListModel.fromJson(Map<String, dynamic> json){ 
        return GroupListModel(
            status: json["status"],
            groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "groups": groups.map((x) => x.toJson()).toList(),
    };

    @override
    String toString(){
        return "$status, $groups, ";
    }
}

class Group {
    Group({
        required this.id,
        required this.title,
    });

    final String? id;
    final String? title;

    Group copyWith({
        String? id,
        String? title,
    }) {
        return Group(
            id: id ?? this.id,
            title: title ?? this.title,
        );
    }

    factory Group.fromJson(Map<String, dynamic> json){ 
        return Group(
            id: json["id"],
            title: json["title"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };

    @override
    String toString(){
        return "$id, $title, ";
    }
}
