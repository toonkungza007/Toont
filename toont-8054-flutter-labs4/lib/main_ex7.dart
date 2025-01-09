import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Profile Screen Exercise",
    home: ProfileScreen(
      name: "Toont",
      id: "643040805-4",
      imagePath: "images/toont.jpg",
      photoCreditOwner: "Toont",
    ),
  ));
}

class ProfileScreen extends StatelessWidget {
  final String name;
  final String id;
  final String imagePath;
  final String photoCreditOwner;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.id,
    required this.imagePath,
    required this.photoCreditOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 128, 170),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Photo Credit: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    photoCreditOwner,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
