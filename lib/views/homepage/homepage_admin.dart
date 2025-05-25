import 'package:flutter/material.dart';

class HomepageAdmin extends StatefulWidget {
  const HomepageAdmin({super.key});

  @override
  State<HomepageAdmin> createState() => _HomepageAdminState();
}

class _HomepageAdminState extends State<HomepageAdmin> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF191A21),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                // /padding: EdgeInsets.all(20),
                child: Text(
                  'Homie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _drawerItem(Icons.home, "Home", 0),
              _drawerItem(Icons.settings, "Settings", 1),
              _drawerItem(Icons.logout, "Logout", 2),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return Column(
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
              colors: [
                Color.fromRGBO(128, 80, 255, 1), // Purple
                Color.fromRGBO(0, 186, 255, 1),  // Blue
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : null,
            color: isSelected ? null : const Color.fromRGBO(35, 35, 44, 1),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: const Color.fromRGBO(43, 44, 53, 1)),
          ),
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(icon, color: Colors.white),
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                //Navigator.pop(context); // Optional: remove if keeping drawer open
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
