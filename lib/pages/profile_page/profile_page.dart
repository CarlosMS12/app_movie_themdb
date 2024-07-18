import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://github.com/CarlosMS12/React-App-Movies/blob/main/src/assets/image/avatar.png?raw=true"),
              radius: 70,
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              trailing: const Icon(Icons.chevron_right),
              subtitle: const Text("Theme"),
              title: const Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text("Theme"),
              title: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Logout")),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
                onPressed: () {},
                color: Colors.white,
                child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}
