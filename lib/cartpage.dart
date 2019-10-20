import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CartTile(),
    );
  }
}

class CartTile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartTileState();
  }
}

class CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
      child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey[400], offset: Offset(2, 2))
            ],
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.045,
                backgroundImage: AssetImage('images/corn.jpg'),
              ),
              Expanded(
                  child: new Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('corn', style: TextStyle(fontSize: 18)),
                  )),
              Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            icon: Icon(Icons.remove),
                            iconSize: 15,
                            color: Colors.red,
                            onPressed: null
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(1.toString() + " pcs")),
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              icon: Icon(Icons.add),
                              iconSize: 15,
                              color: Colors.red,
                              onPressed: null)
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
