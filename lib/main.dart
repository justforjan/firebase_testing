import 'package:firebase_testing/firebase_options.dart';
import 'package:firebase_testing/pages/auth_page.dart';
import 'package:firebase_testing/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: origTheme,
      home: AuthPage(),
    );
  }
}
