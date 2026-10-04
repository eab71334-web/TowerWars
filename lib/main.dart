import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // تثبيت الشاشة بالوضع الطولي أو العرضي حسب نظام لعبتك
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const GodotContainerApp());
}

class GodotContainerApp extends StatelessWidget {
  const GodotContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tower Wars',
      theme: ThemeData.dark(),
      home: const GameContainerScreen(),
    );
  }
}

class GameContainerScreen extends StatefulWidget {
  const GameContainerScreen({super.key});

  @override
  State<GameContainerScreen> createState() => _GameContainerScreenState();
}

class _GameContainerScreenState extends State<GameContainerScreen> {
  bool isGameLoaded = false;

  @override
  void initState() {
    super.initState();
    _initializeGodotGame();
  }

  Future<void> _initializeGodotGame() async {
    // محاكاة تحميل حزمة اللعبة game.pck المدمجة من Godot
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isGameLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1428),
      body: isGameLoaded
          ? const Center(
              child: Text(
                'تم تحميل حزمة Godot (game.pck) بنجاح!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(color: Colors.cyanAccent),
            ),
    );
  }
}
