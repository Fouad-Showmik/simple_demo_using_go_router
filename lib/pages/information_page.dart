import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:router_demo/providers/user_data_provider.dart';

class ProfileInfoPage extends ConsumerWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Summary',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        backgroundColor: Color.fromARGB(255, 37, 40, 134),
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Center(
        // This is the key: it centers the entire Column vertically and horizontally
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (userData.profilePicture != null)
              CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(userData.profilePicture!),
              ),
            SizedBox(height: 20),
            Text('Name: ${userData.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${userData.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Age: ${userData.age}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Selected Services:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...userData.selectedServices.map(
              (s) => Text('- $s', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
