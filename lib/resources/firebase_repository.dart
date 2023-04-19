import 'package:calling/models/message.dart';
import 'package:calling/models/userclass.dart';
import 'package:calling/resources/firebase_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<User> getCurrentUser() => _firebaseMethods.getCurrentUser(); //현재 유저를 받아오기

  Future<UserCredential> signIn() => _firebaseMethods.signIn(); //로그인

  Future<bool> authenticateUser(User user) => _firebaseMethods.authenticateUser(user); //사용자 자격 증명

  Future<void> addDataToDb(User user) => _firebaseMethods.addDataToDb(user); //새로운 사용자 추가

  Future<void> signOut() => _firebaseMethods.signOut();

  Future<List<UserClass>> fetchAllUsers(User user) =>
      _firebaseMethods.fetchAllUsers(user);

  Future<void> addMessageToDb(Message message, UserClass sender, UserClass receiver) =>
      _firebaseMethods.addMessageToDb(message, sender, receiver);

  Future<UserClass> getUserDetails() => _firebaseMethods.getUserDetails();
}