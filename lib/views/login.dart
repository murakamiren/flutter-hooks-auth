import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_hooks/utils/auth.dart';
import 'package:riverpod_hooks/views/home.dart';
import 'package:riverpod_hooks/views/signup.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useState("");
    final password = useState("");
    final err = useState("");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
        child: Column(
          children: [
            if (err.value != "")
              Text(
                err.value,
                style: TextStyle(color: Colors.red.shade400),
              ),
            if (err.value != "")
              const SizedBox(
                height: 10,
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
              onPressed: () async {
                await passwordLogin(
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
              child: const Text("login"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("もしくは"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpView(),
                  ),
                );
              },
              child: const Text("アカウントを作成する"),
            )
          ],
        ),
      ),
    );
  }
}
