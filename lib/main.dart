import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no_app/config/theme/app_theme.dart';
import 'package:yes_or_no_app/providers/chat_provider.dart';
import 'package:yes_or_no_app/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme(selectedColor: 7).theme(),
        home: ChatScreen(),
      ),
    );
  }
}
