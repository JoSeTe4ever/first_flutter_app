import 'package:first_app/config/theme/app_theme.dart';
import 'package:first_app/presentation/screens/chat/chat_screen.dart';
import 'package:first_app/presentation/screens/counter_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(buildApp());
}

MaterialApp buildApp() {
  return MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: AppTheme().theme(),
    home: const Scaffold(
      body: ChatScreen(),
    ),
  );
}