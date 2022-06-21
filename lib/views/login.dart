import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              TextField(
                decoration: InputDecoration(hintText: "email"),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(hintText: "password"),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("login"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text("もしくは"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("アカウントを作成する"),
              )
            ],
          ),
        ));
  }
}
