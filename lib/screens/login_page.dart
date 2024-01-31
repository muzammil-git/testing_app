import 'package:fitness_app/models/login_provider.dart';
import 'package:fitness_app/routes/router_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/theme_provider.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var loginInfo = Provider.of<LoginProvider>(context);
    var themeInfo = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        actions: [
          IconButton(
            onPressed: (){
              themeInfo.toggleTheme();
            },
            icon: themeInfo.isDark ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Page"),

            ElevatedButton(
                onPressed: (){
                  loginInfo.setLoggedIn = true;
                  context.go("/");
                },
                child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
