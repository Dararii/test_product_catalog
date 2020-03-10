import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproductcatalog/core/platform/network_info.dart';
import 'package:testproductcatalog/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:testproductcatalog/features/product_catalog/data/datasources/get_product_remote_datasource.dart';
import 'package:testproductcatalog/features/product_catalog/data/repositories/catalog_repository_impl.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/get_product_%20by_id.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/get_products.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/sort_by_enum.dart';
import 'package:testproductcatalog/features/product_catalog/presentation/providers/product_list_provider.dart';
import 'package:testproductcatalog/features/product_catalog/presentation/widgets/product_item_widget.dart';

class ProductCatalogPage extends StatefulWidget {
  @override
  _ProductCatalogPageState createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  String status = "Status Text";
  List<Product> products = List();

  void getProducts() async {
    var result = await GetProducts(
      CatalogRepositoryImpl(
        remoteDataSource: GetProductRemoteDataSourceImpl(),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).execute(name: "Sampo", categoryId: "1", sortBy: SortBy.nameAsc);

    result.fold(
      (exception) {
        status = exception.toString();
        setState(() {});
      },
      (listProduct) {
        Provider.of<ProductListProvider>(context, listen: false)
            .updateData(listProduct);
        status = "Got data from server! Product List";
        setState(() {});
      },
    );
  }

  void getProductsById() async {
    var result = await GetProductById(
      CatalogRepositoryImpl(
        remoteDataSource: GetProductRemoteDataSourceImpl(),
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      ),
    ).execute(productId: "Id");

    result.fold(
      (exception) {
        status = exception.toString();
        setState(() {});
      },
      (product) {
        List<Product> list = List();
        list.add(product);
        Provider.of<ProductListProvider>(context, listen: false)
            .updateData(list);
        status = "Got data from server! Product By Id";
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    products = Provider.of<ProductListProvider>(context).products ?? List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Catalogue Test - Darari"),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              status,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Search Product by Id"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    getProductsById();
                  },
                  child: Text("Search"),
                ),
                FlatButton(
                  onPressed: () {
                    getProducts();
                  },
                  child: Text("Get Product List"),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  var p = products[index];
                  return ProductItemWidget(p: p);
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberTriviaPage()),
                );
              },
              child: Text("Number Trivia Page"),
            )
          ],
        ),
      ),
    );
  }
}
