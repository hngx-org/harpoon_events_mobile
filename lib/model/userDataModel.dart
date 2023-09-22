class UserDataModel {
    UserDataModel({
        required this.status,
        required this.user,
        required this.token,
    });

    final String? status;
    final User? user;
    final String? token;

    UserDataModel copyWith({
        String? status,
        User? user,
        String? token,
    }) {
        return UserDataModel(
            status: status ?? this.status,
            user: user ?? this.user,
            token: token ?? this.token,
        );
    }

    factory UserDataModel.fromJson(Map<String, dynamic> json){ 
        return UserDataModel(
            status: json["status"],
            user: json["user"] == null ? null : User.fromJson(json["user"]),
            token: json["token"],
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
        "token": token,
    };

    @override
    String toString(){
        return "$status, $user, $token, ";
    }
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.avatar,
    });

    final String? id;
    final String? name;
    final String? email;
    final String? avatar;

    User copyWith({
        String? id,
        String? name,
        String? email,
        String? avatar,
    }) {
        return User(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            avatar: avatar ?? this.avatar,
        );
    }

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["id"],
            name: json["name"],
            email: json["email"],
            avatar: json["avatar"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
    };

    @override
    String toString(){
        return "$id, $name, $email, $avatar, ";
    }
}
