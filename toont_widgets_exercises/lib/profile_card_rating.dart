import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        color: const Color.fromARGB(255, 231, 137, 235),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContactImage(
              imageFile: "image/toont.jpg",
              name: "Toont",
            ),
            ContactInfo(
              addrName: "Toont's Place",
              addrInfo: "Udon, Thailand, 41000",
              email: "toont.s@kkumail.com",
              phone: "(099) 339 9693",
            ),
            Ratings(),
          ],
        ),
      ),
    );
  }
}

class ContactImage extends StatelessWidget {
  final String imageFile;
  final String name;

  ContactImage({required this.imageFile, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            imageFile,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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

  ContactInfo({
    required this.addrName,
    required this.addrInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoRow(icon: Icons.business, text: addrName),
            InfoRow(icon: Icons.location_on, text: addrInfo),
            Divider(),
            InfoRow(icon: Icons.phone, text: phone),
            Divider(),
            InfoRow(icon: Icons.email, text: email),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color:
              index < 4 ? const Color.fromARGB(255, 238, 255, 0) : Colors.black,
          size: 30,
        );
      }),
    );
  }
}
