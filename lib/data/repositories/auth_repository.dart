import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant.dart';

class AuthRepository {
  late SharedPreferences sharedPreferences;
  static SignUpStatus signUpStatus = SignUpStatus.pending;
  static LoginStatus loginStatus = LoginStatus.pending;

  Future<SignUpStatus> createUserAccount(
      {required String name,
      required String email,
      required String password,
      required String phoneNo}) async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await user?.updateDisplayName(name);
      if (user != null) {
        print(
            '//////////////////////////=========>>>>>>>>>>>>> user id: ${user.uid}');
        String uid = user.uid;
        UserModel userModel =
            UserModel(name: name, uid: uid, email: email, phoneNo: phoneNo);
        await FirebaseFirestore.instance
            .collection(usersDbName)
            .doc(uid)
            .set(userModelToMap(userModel))
            .then((value) async {
          signUpStatus = SignUpStatus.successful;
        }).catchError((err) {
          signUpStatus = SignUpStatus.failed;
          debugPrint('Error occured: $err');
        });
      } else {
        signUpStatus = SignUpStatus.failed;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        signUpStatus = SignUpStatus.exists;
      }
    } catch (e) {
      debugPrint(e.toString());
      signUpStatus = SignUpStatus.failed;
    }
    return signUpStatus;
  }

  Future<LoginStatus> loginUser(email, password) async {
    try {
      var response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('============>>>>>>>>>>>>>>>>>>>>> signed in, $response');
      User? user = response.user;
      if (user != null) {
        loginStatus = LoginStatus.successful;
      } else {
        loginStatus = LoginStatus.noUser;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        loginStatus = LoginStatus.noUser;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        loginStatus = LoginStatus.wrongPassword;
      }
    } catch (e) {
      debugPrint(e.toString());
      loginStatus = LoginStatus.failed;
    }
    return loginStatus;
  }
}
