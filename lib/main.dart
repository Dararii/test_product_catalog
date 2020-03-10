import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproductcatalog/features/product_catalog/presentation/pages/product_catalog_page.dart';
import 'package:testproductcatalog/features/product_catalog/presentation/providers/product_list_provider.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Timer(Duration(seconds: 1), () {
    di.init();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductListProvider>(
          create: (context) => ProductListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Test Product Catalog',
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.green.shade600,
        ),
        home: ProductCatalogPage(),
      ),
    );
  }
}
