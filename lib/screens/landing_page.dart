import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Landing Page"),
              ElevatedButton(
                onPressed: () {
                  context.go("/setting");
                },
                child: const Text("Go to setting page"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.push("/premium");
                },
                child: const Text("Go to Premium Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
