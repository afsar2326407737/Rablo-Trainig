import 'package:flutter/material.dart';
import 'package:socila_media_application/models/UserModel.dart';
import 'package:socila_media_application/models/app_data.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;

  const UserProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    // Fetch the user using the userId
    User user = AppData().getUsers().firstWhere((u) => u.id == userId);

    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display user's name
            Text(
              user.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display user's username
            Text(
              '@${user.username}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Display user's email
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text(user.email, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            // Display user's phone number
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Text(user.phone, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            // Display user's website
            Row(
              children: [
                Icon(Icons.web),
                SizedBox(width: 8),
                Text(user.website, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 24),
            // Display user's address
            Text(
              'Address:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${user.address.street}, ${user.address.suite}\n${user.address.city}, ${user.address.zipcode}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Display user's company
            Text(
              'Company:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              user.company.name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              user.company.catchPhrase,
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            Text(
              user.company.bs,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
