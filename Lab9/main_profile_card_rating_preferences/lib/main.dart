import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CelebProfileScreen(),
    );
  }
}

class CelebProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 129, 238),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(imageFile: "image/toont.jpg", name: "Toont"),
          ContactInfo(
            addrName: "Toont's Place",
            addrInfo: "Udon, Thailand, 41000",
            email: "toont.s@kkumail.com",
            phone: "(099) 339 9693",
          ),
          Ratings(),
        ],
      ),
    );
  }
}

class ContactImage extends StatelessWidget {
  final String imageFile;
  final String name;

  const ContactImage({super.key, required this.imageFile, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(imageFile),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String addrName;
  final String addrInfo;
  final String email;
  final String phone;

  const ContactInfo({
    super.key,
    required this.addrName,
    required this.addrInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _infoRow(Icons.location_on, addrName, addrInfo),
            _infoRow(Icons.phone, "Phone", phone),
            _infoRow(Icons.email, "Email", email),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}

class Ratings extends StatefulWidget {
  @override
  _RatingsState createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  int selectedStars = 0;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  Future<void> _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedStars = prefs.getInt('rating') ?? 0;
    });
    print('loadRating: rating is $selectedStars');
  }

  Future<void> _saveRating(int rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('rating', rating);
    print('saveRating: rating is $rating');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedStars = index + 1;
            });
            _saveRating(selectedStars);
          },
          child: Icon(
            Icons.star,
            color: index < selectedStars ? Colors.blue : Colors.white,
            size: 40,
          ),
        );
      }),
    );
  }
}