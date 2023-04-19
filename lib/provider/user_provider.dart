import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:calling/resources/firebase_repository.dart';
import '../models/userclass.dart';

class UserProvider with ChangeNotifier {
  UserClass? _userclass;
  FirebaseRepository _firebaseRepository = FirebaseRepository();

  UserClass? get getUser => _userclass;

  void refreshUser() async {
    UserClass userclass = await _firebaseRepository.getUserDetails();
    _userclass = userclass;
    notifyListeners();
  }

}