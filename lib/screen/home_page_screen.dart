import 'package:flutter/material.dart';
import 'package:instagram/screen/add_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  int _currenPage = 0;

  void selectPage(index){
    setState(() {
      _currenPage = index;
    });
  }

  static const List<Widget> _list = <Widget>[
    Center(
      child: Text('This is home', style: TextStyle(color: Colors.white),),
    ),
    Center(
      child: Text('This is search', style: TextStyle(color: Colors.white),),
    ),
    AddScreen(),
    // Center(
    //   child: Text('This is add', style: TextStyle(color: Colors.white),),
    // ),
    Center(
      child: Text('This is favorite', style: TextStyle(color: Colors.white),),
    ),
    Center(
      child: Text('This is person', style: TextStyle(color: Colors.white),),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: _list.elementAt(_currenPage),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _currenPage,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.amber
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Person',
              backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}
