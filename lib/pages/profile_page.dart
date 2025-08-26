import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => context.go('/profile/login'),
          child: const Text('Login to Profile'),
        ),
      ),
    );
  }
}
