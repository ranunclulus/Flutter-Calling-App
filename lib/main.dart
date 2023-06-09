import 'package:calling/provider/user_provider.dart';
import 'package:calling/resources/firebase_repository.dart';
import 'package:calling/screens/login_screen.dart';
import 'package:calling/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:calling/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
          title: "silver call",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/search_screen': (context) => SearchScreen(),
          },
          theme: ThemeData(
            brightness: Brightness.dark
          ),
          home: FutureBuilder(
            future: _repository.getCurrentUser(),
            builder: ((context, AsyncSnapshot<User> snapshot) {
              if(snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            }),
          ),
      ),
    );
  }
}