import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {

  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text("Premium Feature..."),
        ),
      ),
    );
  }
}
