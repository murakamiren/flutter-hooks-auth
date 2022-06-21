import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod_hooks/utils/auth.dart';
import 'package:riverpod_hooks/views/login.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
        ),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("welcome"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  logout(
                    context,
                    () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                  );
                },
                child: const Text("ログアウトする"),
              )
            ],
          ),
        ));
  }
}
