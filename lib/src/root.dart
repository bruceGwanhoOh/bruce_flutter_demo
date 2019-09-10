import 'package:bruce_flutter_demo/src/screens/catalog/cart_screen.dart';
import 'package:bruce_flutter_demo/src/screens/catalog/catalog_screen.dart';
import 'package:bruce_flutter_demo/src/screens/home/home_screen.dart';
import 'package:bruce_flutter_demo/src/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';
import 'models/catalog_model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/catalog': (context) => CatalogScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
      providers: [
        Provider(builder: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            builder: (context, catalog, previousCart) =>
                CartModel(catalog, previousCart)),
      ],
    );
  }
}
