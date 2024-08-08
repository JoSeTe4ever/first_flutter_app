import 'package:first_app/config/theme/app_theme.dart';
import 'package:first_app/presentation/providers/chat_provider.dart';
import 'package:first_app/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(buildApp());
}

buildApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChatProvider()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const Scaffold(
        body: ChatScreen(),
      ),
    ),
  );
}