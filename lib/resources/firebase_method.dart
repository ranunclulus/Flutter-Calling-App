import 'package:calling/resources/firebase_repository.dart';
import 'package:calling/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calling/models/userclass.dart';
import '../models/message.dart';
import 'package:calling/constants/string.dart';

class FirebaseMethods {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final CollectionReference _userCollections = _firebasefirestore.collection(CALL_COLLECTION);
  static final FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;

  UserClass userclass = UserClass();

  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await _auth.currentUser!;
    return currentUser;
  }

  Future<UserCredential> signIn() async {
    GoogleSignInAccount? _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication = await _signInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _signInAuthentication.accessToken,
      idToken: _signInAuthentication.idToken
    );

    UserCredential user = await _auth.signInWithCredential(credential);
    return user;
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await firebasefirestore
      .collection("users")
      .where("email", isEqualTo: user.email)
      .get();

    final List<DocumentSnapshot> docs = result.docs;
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(User user) async{

    String username = Utils.getUsername(user.email ?? "");

    userclass = UserClass(
      uid: user.uid,
      email: user.email,
      name: user.displayName,
      profilePhoto: user.photoURL,
      username: username
    );

    firebasefirestore
    .collection("users")
    .doc(user.uid)
    .set(userclass.toMap(userclass) as Map<String, dynamic>);
  }

  Future<void> signOut() async{
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    return await _auth.signOut();
  }

  Future<List<UserClass>> fetchAllUsers(User currentUser) async {
    List<UserClass> userList = <UserClass>[];
    QuerySnapshot querySnapshot =
        await firebasefirestore.collection("users").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(UserClass.fromMap(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    }
    return userList;
  }

  Future<DocumentReference<Map<String, dynamic>>> addMessageToDb(
      Message message, UserClass sender, UserClass receiver) async {
    var map = message.toMap();

    await firebasefirestore
        .collection("messages")
        .doc(message.senderId)
        .collection(message.receiverId!)
        .add(map as Map<String, dynamic>);

    return await firebasefirestore
        .collection("messages")
        .doc(message.receiverId!)
        .collection(message.senderId!)
        .add(map);
  }

  Future<UserClass> getUserDetails() async {
    User currentUser = await getCurrentUser();

    DocumentSnapshot documentSnapshot =
    await _userCollections.doc(currentUser.uid).get();

    return UserClass.fromMap(await documentSnapshot.data as Map<String, dynamic>);
  }
}