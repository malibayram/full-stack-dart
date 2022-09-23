import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user.dart';
import 'utils/routes.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  await Hive.openBox<User>('users');

  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<User>('users').get('user');

    return MaterialApp.router(
      supportedLocales: const [
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      title: 'Flutter Frontend',
      routerConfig: routes(user),
    );
  }
}
