import 'package:cinema/shared/presentation/provider/ui_provider.dart';
import 'package:cinema/shared/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers :[
        ChangeNotifierProvider(create: (_) => UiProvider())
      ],
      child: const MaterialApp(
        title: "Cinema App",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
