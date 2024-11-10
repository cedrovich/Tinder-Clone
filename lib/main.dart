import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/multi_step_login.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicialización de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Tinder Clone',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/', // Ruta inicial
        routes: {
          '/': (context) => LoginScreen(), // Pantalla de inicio de sesión
          '/register': (context) => RegisterScreen(), // Pantalla de registro
          '/home': (context) => HomeScreen(), // Pantalla principal
          '/profile': (context) => ProfileScreen(), // Pantalla de perfil
          '/matches': (context) => MatchesScreen(), // Pantalla de matches
          '/settings': (context) => SettingsScreen(), // Pantalla de configuración
          '/multi_step_login': (context) => MultiStepLoginScreen(), // Pantalla de login en varios pasos
        },
      ),
    );
  }
}
