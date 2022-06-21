import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_hooks/views/home.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> passwordLogin(
    ValueNotifier<String> email,
    ValueNotifier<String> password,
    ValueNotifier<String> errState,
    BuildContext context,
    VoidCallback navigate) async {
  try {
    if (email.value == "" || password.value == "") {
      errState.value = "メールまたはパスワードが入力されていません";
      return;
    }
    await auth.signInWithEmailAndPassword(
      email: email.value,
      password: password.value,
    );
    errState.value = "";
    navigate.call();
  } on FirebaseAuthException catch (expE) {
    if (expE.code == "user-not-found") {
      errState.value = "該当するユーザーが見つかりません";
    } else if (expE.code == "wrong-password") {
      errState.value = "パスワードが違います";
    } else {
      errState.value = "oops! 何がおかしいです！";
    }
  }
}

void logout(BuildContext context, VoidCallback navigate) async {
  await auth.signOut();
  navigate.call();
}
