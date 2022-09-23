import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user.dart';
import 'pages/index.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  await Hive.openBox<User>('users');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<User>('users').get('user');

    return MaterialApp(
      title: 'Flutter Frontend',
      home: Scaffold(
        body: user == null ? const LoginPage() : const ProfilePage(),
      ),
    );
  }
}
