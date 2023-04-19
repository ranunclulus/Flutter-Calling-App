import 'package:calling/resources/firebase_repository.dart';
import 'package:calling/screens/home_screen.dart';
import 'package:calling/utils/universal_variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseRepository _repository = FirebaseRepository();

  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: Stack(
          children: [
            Center(
              child: loginButton(),
            ),
            isLoginPressed
              ? Center(
              child: CircularProgressIndicator(),
            )
                : Container()
          ],
      )
    );
  }

  Widget loginButton() {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: UniversalVariables.senderColor,
        child: ButtonTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2),
              ),
            ),
            onPressed: () => performLogin(),
          ),
        ));
  }

  void performLogin() {
    print("tring to perform login");

    setState(() {
      isLoginPressed = true;
    });

    _repository.signIn().then(((UserCredential credentialuser) {
      if (credentialuser != null) {
        User? user = credentialuser.user;
        authenticateUser(user!);
      } else {
        print("There was an erro");
      }
    }));
  }

  void authenticateUser(User user) {
    _repository.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });
      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }
}
