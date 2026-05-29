import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second/models/product/product.dart';

class ECartScreen extends StatefulWidget {
  const ECartScreen({super.key});

  @override
  State<ECartScreen> createState() => _ECartScreenState();
}

class _ECartScreenState extends State<ECartScreen> {
  Dio dio = Dio();
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  List<Product> product = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Product')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                var item = product[index];
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        CachedNetworkImage(
                          height: 80,
                          width: 80,
                          imageUrl: item.image!,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  LinearProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(item.title!, maxLines: 2),
                              Text(item.category!),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amberAccent),
                                  Text(item.rating!.rate.toString()),
                                  Text('(${item.rating!.count.toString()})'),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            Text('\$${item.price}'),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.shopping_cart),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future getProducts() async {
    try {
      isLoading = true;
      setState(() {});
      final response = await dio.get(
        "https://fakestoreapi.com/products",
        data: {},
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        product = data.map((json) => Product.fromJson(json)).toList();
      }
    } catch (e) {
      print('product error is ${e.toString()}');
    } finally {
      setState(() {});

      isLoading = false;
    }
  }

  // 5 button
  //get
  //post // login
  // delete
  // patch
  // update
}
