import 'package:flutter/material.dart';
import 'package:seworkshop_demo/cartpage.dart';
import 'package:seworkshop_demo/product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'CROP MART'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), CartPage(), CartPage()];

  void _incrementCounter() {
    setState(() {
      _counter *= 19;
    });
  }
  void onTabTapped(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.brown[300],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("HOME")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("CART")),
          BottomNavigationBarItem(icon : Icon(Icons.person), title: Text("PROFILE"))
        ],
      ),

    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Widget _buildList(String collection) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection(collection).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading...');
                default:
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data.documents.map((
                          DocumentSnapshot document) {
                        return ProductCard(title: document['productName'],
                            qty: document['qty'],
                            price: document['price']);
                      }).toList()
                  );
              }
            }
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Category Crops"),
      _buildList('crops'),
    ],);
  }
}
