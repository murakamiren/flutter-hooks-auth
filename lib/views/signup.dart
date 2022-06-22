import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_hooks/utils/auth.dart';
import 'package:riverpod_hooks/views/home.dart';

class SignUpView extends HookWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useState("");
    final password = useState("");
    final err = useState("");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "アカウント作成",
              ),
              if (err.value != "")
                Text(
                  err.value,
                  style: TextStyle(color: Colors.red.shade400),
                ),
              TextField(
                decoration: const InputDecoration(hintText: "email"),
                onChanged: (i) {
                  email.value = i;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "password"),
                onChanged: (i) {
                  password.value = i;
                },
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  passwordSignUp(
                    email,
                    password,
                    err,
                    context,
                    () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    },
                  );
                },
                child: const Text("アカウント作成"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
