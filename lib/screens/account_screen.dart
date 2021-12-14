import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello ${context.read<AuthenticatioService>().firebaseAuth.currentUser!.displayName ?? "Name"}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {
                context.read<AuthenticatioService>().signOut();
              },
              child: const Text('Log out'))
        ],
      ),
    );
  }
}
