import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_hooks/views/home.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> passwordSignUp(
    ValueNotifier<String> email,
    ValueNotifier<String> password,
    ValueNotifier<String> err,
    BuildContext context,
    VoidCallback navigate) async {
  try {
    if (email.value == "" || password.value == "") {
      err.value = "メールまたはパスワードが入力されていません";
      return;
    }
    await auth.createUserWithEmailAndPassword(
        email: email.value, password: password.value);
    err.value = "";
    navigate.call();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      err.value = "パスワードが弱いです";
    } else if (e.code == 'email-already-in-use') {
      err.value = "このメールは既に使われています";
    }
  } catch (e) {
    err.value = "oops! 何かがおかしいです";
  }
}

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
