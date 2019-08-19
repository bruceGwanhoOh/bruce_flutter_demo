import 'package:bruce_flutter_demo/src/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.display1,),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(children: <Widget>[
          Expanded(
            child: Padding(padding: EdgeInsets.all(32), child: _CartList(),),
          )
        ],),
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var cart = Provider.of<CartModel>(context);

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}


