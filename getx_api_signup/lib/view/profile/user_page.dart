

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getx_api_signup/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'user_detail_screen.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<UserModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<UserModel> users = [];

      for (var i in data['data']) {
        users.add(UserModel.fromJson(i));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen(user: user),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(user.email),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
