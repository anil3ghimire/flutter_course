import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second/core/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = ["Ram", "Hari", "Amit", "Sita"];
    List<Color> colors = [Colors.red, Colors.blue, Colors.amber, Colors.cyan];
    String _imageUrl =
        "https://images.pexels.com/photos/1229498/pexels-photo-1229498.jpeg";
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),

      drawer: MyDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final name = names[index];
          // final color = colors[index];
          final color = colors[index % colors.length];

          return Container(
            alignment: Alignment.center,
            child: Card(
              child: Column(
                mainAxisAlignment: .end,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Press me')),

                  CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: _imageUrl,
                    placeholder: (context, url) => Image.asset(AppAssets.test),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.test),
                  ),
                  Text(
                    'This is Google Fonts',

                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  Text(
                    'This is a google fonts test screen',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  // SvgPicture.asset('assets/logo.svg'),
                  // Text(
                  //   'This is a RobotoMono ',
                  //   style: TextStyle(fontFamily: 'RobotoMono', fontSize: 34),
                  // ),
                  // Image.asset(height: 120, width: 120, 'assets/chiya.jpg'),
                  // CachedNetworkImage(
                  //   height: 200,
                  //   width: 200,
                  //   imageUrl:
                  //       "https://images.pexels.com/photos/1229498/pexels-photo-1229498.jpeg",
                  //   placeholder: (context, url) =>
                  //       CircularProgressIndicator(value: 2),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  // Image.network(
                  //   height: 100,
                  //   width: 100,
                  //   'https://images.pexels.com/photos/1229498/pexels-photo-1229498.jpeg',
                  // ),
                ],
              ),
            ),
          );
          // return Card(
          //   elevation: 7,
          //   child: ListTile(
          //     leading: Container(
          //       alignment: .center,
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //         color: color,
          //         borderRadius: BorderRadius.circular(40),
          //       ),
          //       child: Text(names.length.toString()),
          //     ),
          //     title: Text('This is a name $name'),
          //     subtitle: Text('This is a subtitle'),
          //     trailing: Icon(Icons.more),
          //   ),
          // );
        },
        // separatorBuilder: (context, index) {
        //   return Divider();
        // },
        itemCount: names.length,
      ),
    );
  }
}
