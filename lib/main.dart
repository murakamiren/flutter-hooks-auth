import 'package:flutter/material.dart';
import 'package:riverpod_hooks/utils/auth.dart';
import 'package:riverpod_hooks/views/home.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:riverpod_hooks/views/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: auth.currentUser == null ? const LoginView() : const HomeView(),
    );
  }
}
