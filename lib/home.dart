import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final user = FirebaseAuth.instance.currentUser;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD2B48C),
        title: Text('Skill boost'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'images/book.png',
                height: 20,
                width: 20,
              ),
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hello user !',
                style: TextStyle(
                  color: Colors.brown, // Change the color to your desired color
                  fontSize: 24.0, // Change the font size to your desired size
                ),
              ),
            ),
            Card(
              clipBehavior: Clip
                  .antiAlias, // Clip.antiAlias for anti-aliased rounded corners
              elevation: 5,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Adjust the radius as needed
                child: Image.asset('images/logo1.png'),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
            color: Color(0xFFD2B48C),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              DrawerHeader(
                  child: Center(
                child: Image.asset('images/logo1.png'),
              )),
              Text('signed in as ' + user!.email!),
              MaterialButton(
                onPressed: FirebaseAuth.instance.signOut,
                color: Colors.brown,
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color:
                        Colors.white, // Change the color to your desired color
                    fontSize: 12.0, // Change the font size to your desired size
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
