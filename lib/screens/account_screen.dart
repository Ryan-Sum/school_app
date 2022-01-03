import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text('User Information'),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Name: ${context.read<AuthenticatioService>().firebaseAuth.currentUser!.displayName ?? "Error: name not found"}'),
                      Text(
                          'Email: ${context.read<AuthenticatioService>().firebaseAuth.currentUser!.email ?? "Error: name not found"}'),
                      const Text('School: Steinbrenner High School'),
                      Text(
                          'User ID: ${context.read<AuthenticatioService>().firebaseAuth.currentUser?.uid ?? "Error: UUID not found"}'),
                      const Text(
                        '\nPlease contact a school administrator to change your email or name. Passwords can be changed from the login screen.',
                        textAlign: TextAlign.center,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              context.read<AuthenticatioService>().signOut();
                            },
                            child: const Text('Log out')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
