import 'package:flutter/material.dart';
import 'package:student_app/pages/details_page.dart';
import 'package:student_app/pages/home_page.dart';


class HabitantsPage extends StatelessWidget {
  final List<Map<String, String>> habitants = [
    {'nom': 'Kusamba', 'commune': 'Limete'},
    {'nom': 'Kikwa', 'commune': 'Lemba'},
    {'nom': 'Iza', 'commune': 'Ngaliema'},
    {'nom': 'Kusamba', 'commune': 'Limete'},
    {'nom': 'Kusamba', 'commune': 'Limete'},
    {'nom': 'Albin' , 'commune':'Selembao'},
    {'nom': 'Albin' , 'commune':'Selembao'},
    {'nom': 'Albin' , 'commune':'Selembao'},
    {'nom': 'Iza', 'commune': 'Ngaliema'},
    {'nom': 'Kusamba', 'commune': 'Limete'},
    {'nom': 'Kusamba', 'commune': 'Limete'},
    {'nom': 'Albin' , 'commune':'Selembao'},

    // Ajoutez d'autres habitants ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF101F34),
        title: Text('Habitants', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              // Action pour la recherche
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: habitants.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Ajuste la valeur selon le rayon désiré
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Espace entre les cartes
            // Ombre pour donner un effet 3D
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text('Nom: ${habitants[index]['nom']}'),
              subtitle: Text('Commune: ${habitants[index]['commune']}'),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                },
                child: Text('Voir plus' ,style: TextStyle(color: Colors.blue),),
              ),
            ),
          );
        },
      ),
    );
  }
}