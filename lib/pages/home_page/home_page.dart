import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  suffixIcon: Icon(Icons.search, color: Color(0xff004cd9)),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xff979797)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              Text("Now Playing",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
