import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:splitting_app/models/users.dart';

import '../models/groups.dart';

class GroupPageViewModel extends ChangeNotifier {

  late final currentUser;

  GroupPageViewModel(Users loggedInUser){
    this.currentUser = loggedInUser;
  }

  final DatabaseReference _groupsRef = FirebaseDatabase.instance.ref().child('groups');

  Future<void> createGroup(String name) async {
    final groupId = _groupsRef.push().key;

    if (groupId != null) {
      final group = Group(
        id: groupId,
        name: name,
        creator: currentUser.username,
        users: [currentUser],
      );

      await _groupsRef.child(groupId).set(group.toJson());
    }
  }

  Future<Group?> joinGroup(String groupId, String code) async {
    final DataSnapshot snapshot = (await _groupsRef.child(groupId).once()) as DataSnapshot;

    if (snapshot.value != null) {
      final groupData = snapshot.value as Map<dynamic, dynamic>;
      final group = Group(
        id: groupId,
        name: groupData['name'],
        creator: groupData['creator'],
        users: List<Users>.from(groupData['users'] as List<Users>),
      );

      if (group.users.contains(code)) {
        group.users.add(currentUser!.username);
        await _groupsRef.child(groupId).update({'members': group.users});
        return group;
      }
    }

    return null;
  }

  Future<List<Group>> getGroups() async {
    final DataSnapshot snapshot = (await _groupsRef.once()) as DataSnapshot;

    final groupList = <Group>[];
    if (snapshot.value != null) {
      final groupData = snapshot.value as Map<dynamic, dynamic>;
      groupData.forEach((groupId, groupInfo) {
        final group = Group(
          id: groupId,
          name: groupInfo['name'],
          creator: groupInfo['creator'],
          users: List<Users>.from(groupInfo['users']),
        );
        groupList.add(group);
      });
    }

    return groupList;
  }
}
