import 'package:flutter/material.dart';
import 'package:student_app/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              "https://img.freepik.com/photos-gratuite/etudiante-heureuse_23-2151936246.jpg?t=st=1741685135~exp=1741688735~hmac=63097ffe324648adb57b8c424883ad9f01913cc74bed49c48b247e9002b4de63&w=740",
              width: 250,
              height: 200,
          ),
          Text(
            "City",
            style: TextStyle(
              fontSize: 48,
              color: Color(0xFF2260FF),
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            "App",
            style: TextStyle(
              fontSize: 48,
              color: Color(0xFF2260FF),
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            "City Management",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF2260FF),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 84),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF070707),
              ),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(
                0xFF2260FF,
              ), // Couleur du texte du bouton (blanc ici)
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            ),
            child: Text("Log In"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(
                0xFFCAD6FF,
              ), // Couleur du texte du bouton (blanc ici)
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 14, color: Color(0xFF2260FF)),
            ),
          ),
        ],
      ),
    );
  }
}