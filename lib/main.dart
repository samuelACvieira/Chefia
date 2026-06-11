import 'package:flutter/material.dart';
import 'database/database_helper.dart';
import 'core/theme/app_theme.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o banco SQLite
  await DatabaseHelper.instance.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChefIA',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}