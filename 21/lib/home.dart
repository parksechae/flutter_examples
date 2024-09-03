import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample/product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Product>> productList;
  Dio dio = Dio();
  int pos = 1;

  @override
  void initState() {
    super.initState();

    productList = getProductData();
  }

  Future<List<Product>> getProductData() async {
    late List<Product> products;
    try {
      var response = await dio.get('https://dummyjson.com/products/${pos}');
      pos++;
      // products = response.data['products']
      //     .map<Product>((product) => Product.fromJson(product))
      //     .toList();
      products = [response.data]
          .map<Product>((product) => Product.fromJson(product))
          .toList();
      print('refreshed');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return products;
  }

  Future<void> refreshProductList() async {
    productList = getProductData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              'Product List',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          RefreshIndicator(
              onRefresh: () => refreshProductList(),
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: FutureBuilder<List<Product>>(
                      future: productList,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                strokeAlign: BorderSide.strokeAlignInside,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = snapshot.data[index];
                                return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black26),
                                    ),
                                    child: Text(
                                      'ID: ${data.id}\nTitle: ${data.title}\nDescription: ${data.description}',
                                      style: const TextStyle(fontSize: 16),
                                    ));
                              });
                        }
                      }))),
        ],
      ),
      //  ----------------------------------------------------------
    );
  }
}
