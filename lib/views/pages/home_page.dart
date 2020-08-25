import 'package:chat_app/views/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Future<SharedPreferences> _getSharedPreference() async =>
      await SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _getSharedPreference(),
      builder: (context, snapshot) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black,
          ),
        ),
        body: (_currentIndex == 0)
            ? Container()
            : AccountPage(
                snapshot.data.getString("name"),
                snapshot.data.getString("image"),
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Account")),
          ],
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
