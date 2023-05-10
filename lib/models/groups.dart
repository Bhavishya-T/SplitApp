import 'package:splitting_app/models/users.dart';

class Group {
  final String id;
  final String name;
  final String creator;
  final List<Users> users;

  Group({
    required this.id,
    required this.name,
    required this.creator,
    required this.users,
  });

  Group.fromJson(Map<String,dynamic> json)
      : name = json['name'],
        creator = json['creator'],
        users = json['users'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'creator':creator,
    'users':users
  };
}