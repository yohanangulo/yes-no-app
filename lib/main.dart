import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/chat/chat_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 6).theme(),
      title: 'Yes No App',
      home: const ChatScreen(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: FilledButton.tonal(
      //       onPressed: () {},
      //       child: const Text('click me'),
      //     ),
      //   ),
      // ),
    );
  }
}
