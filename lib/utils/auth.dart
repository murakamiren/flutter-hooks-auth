import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void passwordLogin(ValueNotifier<String> email, ValueNotifier<String> password,
    ValueNotifier<String> errState) async {
  try {
    if (email.value == "" || password.value == "") {
      errState.value = "メールまたはパスワードが入力されていません";
      return;
    }
    await _auth.signInWithEmailAndPassword(
      email: email.value,
      password: password.value,
    );
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
