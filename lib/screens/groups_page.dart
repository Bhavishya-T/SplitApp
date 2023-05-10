import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitting_app/controller/group_page_view_model.dart';

import '../models/groups.dart';
import '../models/users.dart';

class GroupPage extends StatelessWidget {
  Users user = Users(username: "", password: "");


  GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    user=arg['loggedInUser'];
    return ChangeNotifierProvider(
      create: (_) => GroupPageViewModel(user),
      child: Consumer<GroupPageViewModel>(
        builder: (context, userViewModel, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Groups'),
            centerTitle: true,
          ),
          body: FutureBuilder<List<Group>>(
            future: userViewModel.getGroups(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData) {
                final groupList = snapshot.data!;

                return ListView.builder(
                  itemCount: groupList.length,
                  itemBuilder: (context, index) {
                    final group = groupList[index];
                    return ListTile(
                      title: Text(group.name),
                      subtitle: Text('Created by: ${group.creator}'),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Join Group'),
                              content: TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Enter Shared Code',
                                ),
                                onChanged: (value) {
                                  // Handle shared code input
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, null),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // final code = sharedCodeController.text;
                                    // Navigator.pop(context, code);
                                  },
                                  child: const Text('Join'),
                                ),
                              ],
                            ),
                          );

                          if (result != null) {
                            final joinedGroup =
                                await userViewModel.joinGroup(group.id, result);
                            if (joinedGroup != null) {
                              // Handle successful join
                            } else {
                              // Handle failed join
                            }
                          }
                        },
                        child: const Text('Join'),
                      ),
                    );
                  },
                );
              }

              return const Center(child: Text('No groups found.'));
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Create Group'),
                  content: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Group Name',
                    ),
                    onChanged: (value) {
                      // Handle group name input
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, null),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // final name = groupNameController.text;
                        // Navigator.pop(context, name);
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              );

              if (result != null) {
                await userViewModel.createGroup(result);
                // Handle successful group creation
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
