import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitting_app/screens/groups_page.dart';
import 'package:splitting_app/screens/login_page.dart';
import 'package:splitting_app/screens/signup_page.dart';

import 'controller/login_page_view_model.dart';
import 'firebase_options.dart';
import 'models/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageViewModel(),
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/groups': (context) => GroupPage(),
        },
      ),
    );
  }
}