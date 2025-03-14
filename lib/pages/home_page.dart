import 'package:flutter/material.dart';
import 'package:student_app/pages/details_page.dart';
import 'package:student_app/pages/enregistrement_page.dart';
import 'package:student_app/pages/list_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> stats = [
    {'icon': Icons.apartment, 'count': 1000},
    {'icon': Icons.family_restroom, 'count': 350},
    {'icon': Icons.woman, 'count': 500},
    {'icon': Icons.man, 'count': 250},
  ];

  final List<Map<String, dynamic>> cities = [
    {'name': 'Mumbele', 'population': 1000},
    {'name': 'Gungu', 'population': 2000},
    {'name': 'Kwilu', 'population': 3000},
    {'name': 'Mumbele', 'population': 1000},
    {'name': 'Gungu', 'population': 2000},
    {'name': 'Kwilu', 'population': 3000},
    {'name': 'Mumbele', 'population': 1000},
    {'name': 'Gungu', 'population': 2000},
    {'name': 'Kwilu', 'population': 3000},
    {'name': 'Mumbele', 'population': 1000},
    {'name': 'Gungu', 'population': 2000},
    {'name': 'Kwilu', 'population': 3000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF101F34),
        title: Text('City Management', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        }),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF101F34)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Enregistrement'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FormPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Liste habitants'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HabitantsPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Aide'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xFF101F34),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Recherche',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stats
                  .map(
                      (stat) => Container(
                    color: Color(0xFFE4E3E3),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(stat['icon'], size: 40, color: Colors.blue),
                        Text(stat['count'].toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
              )
                  .toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text(
                        cities[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text('${cities[index]['population']} Habitants'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
