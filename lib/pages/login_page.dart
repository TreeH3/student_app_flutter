
import 'package:flutter/material.dart';
import 'package:student_app/business/models/authenticate.dart';
import 'package:student_app/business/services/user_network_service.dart';
import 'package:student_app/main.dart';
import 'package:student_app/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var userNetworkService = getIt<UserNetworkService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  "Connexion",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Bienvenue sur CityManagement",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 80),
              Text("Email ou numero de téléphone",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 20),
              Text("Mot de passe",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Mot de passe oubliée",
                      style: TextStyle(color: Color(0xFF38b6ff))),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF38b6ff),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onPressed: () async {
                    var data=Authentication(email: emailCtrl.text, password: passwordCtrl.text);
                    var resultat = await userNetworkService.authenticate(data);
                    if (resultat) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                  },
                  child: Text("Se connecter",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
