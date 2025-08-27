import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:router_demo/providers/user_data_provider.dart';

class ServicePage extends ConsumerWidget {
  final List<String> allServices = [
    'Furniture',
    'Medicine',
    'Fashion',
    'Electronics',
    'Food',
  ];
  ServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Services',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 40, 134),
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            // Name
            TextFormField(
              initialValue: userData.name,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.white54),
              ),
              onChanged: (val) => ref.read(userDataProvider.notifier).state =
                  userData.copyWith(name: val),
            ),
            SizedBox(height: 20),
            // Email
            TextFormField(
              initialValue: userData.email,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white54),
              ),
              onChanged: (val) => ref.read(userDataProvider.notifier).state =
                  userData.copyWith(email: val),
            ),
            // Age
            SizedBox(height: 20),

            TextFormField(
              initialValue: userData.age == 0 ? '' : userData.age.toString(),
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                border: OutlineInputBorder(),
                hintText: 'Enter your age',
                hintStyle: TextStyle(color: Colors.white54),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) => ref.read(userDataProvider.notifier).state =
                  userData.copyWith(age: int.tryParse(val) ?? 0),
            ),

            SizedBox(height: 40),
            // Services Checkboxes
            ...allServices.map((service) {
              final selected = userData.selectedServices.contains(service);
              return CheckboxListTile(
                title: Text(service, style: TextStyle(color: Colors.white)),
                value: selected,
                onChanged: (val) {
                  final updatedList = val == true
                      ? [...userData.selectedServices, service]
                      : userData.selectedServices
                          .where((s) => s != service)
                          .toList();
                  ref.read(userDataProvider.notifier).state =
                      userData.copyWith(selectedServices: updatedList);
                },
              );
            }),
            // Profile Photo Upload
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final picker = ImagePicker();
                final picked =
                    await picker.pickImage(source: ImageSource.gallery);
                if (picked != null) {
                  ref.read(userDataProvider.notifier).state =
                      userData.copyWith(profilePicture: File(picked.path));
                }
              },
              child: Text('Upload Profile Photo'),
            ),
            if (userData.profilePicture != null)
              Image.file(userData.profilePicture!, height: 100),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()
                  //=> Navigator.pushNamed(context, '/login'),
                  {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Submitted')),
                );
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
