import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF101F34),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          Icon(Icons.more_vert)
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icône de flèche retour
          onPressed: () {
            Navigator.of(context).pop() ;
            },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity,),
          Icon(Icons.person, size: 100,),
          SizedBox(height: 30,),
          Text("Username"),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF101F34),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            ),
            child: Text("Sign out"),
          ),
        ],
      ),
    );
  }
}
