import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20)
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ),
    );
  }
}
