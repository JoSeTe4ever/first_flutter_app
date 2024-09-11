import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
