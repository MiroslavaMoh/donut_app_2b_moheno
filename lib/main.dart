import 'package:donut_app_2b_moheno/pages/home_page.dart'; 
import 'package:donut_app_2b_moheno/screen/login/startup_screen.dart';
import 'package:flutter/material.dart';

// Inicialización de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/foundation.dart' show kIsWeb; 
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartUpScreen(),
    );
  }
}
