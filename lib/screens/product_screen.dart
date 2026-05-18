import 'package:flutter/material.dart';
import 'package:flutter_second/widgets/button_widget.dart';
import 'package:flutter_second/widgets/my_drawer_widget.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../widgets/custom_textform.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> countryItem = <String>["NP", "IN", "PK"];
  String weeks = "SUN";
  List<String> list = ['One', 'Two', 'Three', 'Four'];
  bool checkBox = true;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Screen')),

      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          spacing: 10,
          children: [
            DropdownButtonFormField(
              initialValue: list.first,
              items: list.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (v) {},
            ),
            DropdownButton(
              value: countryItem[0],
              items: countryItem.map((items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (v) {
                setState(() {
                  // countryItem = v!;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                label: Text('labelText', style: TextStyle(color: Colors.red)),
                hint: Text('hintText'),
                prefixIcon: Icon(Icons.settings_applications),
              ),
              onSaved: (newValue) {},
              validator: (value) {},
            ),

            CustomTextField(
              labelText: 'UserName',
              hintText: 'Amit Sharma',
              iconData: Icons.person,
              inputType: TextInputType.name,
            ),

            CustomTextField(
              labelText: 'Email',
              hintText: '',
              iconData: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: checkBox,
                  onChanged: (v) {
                    setState(() {
                      checkBox = v!;
                    });
                  },
                ),
                Text('Accept Terms and Con..'),
              ],
            ),

            Row(
              children: [
                Switch.adaptive(value: true, onChanged: (value) {}),
                Switch(
                  value: switchValue,
                  onChanged: (newValue) {
                    setState(() {
                      switchValue = newValue;
                    });
                  },
                ),
                switchValue ? Text('Dark Mode') : Text('Light Mode'),
              ],
            ),

            // RichText(
            //   text: TextSpan(
            //     text: 'Hello ',
            //     style: DefaultTextStyle.of(context).style,
            //     children: const <TextSpan>[
            //       TextSpan(
            //         text: 'bold',
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       TextSpan(text: '  world!'),
            //     ],
            //   ),
            // ),
            SelectionArea(
              child: RichText(
                text: TextSpan(
                  text: 'Login',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'OK',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ),
            Button(
              onTap: () {
                if (checkBox == true) {}
                print('This is login Btn');
              },
              backgroundColor: Colors.red,
              title: "Login",
              icon: MaterialCommunityIcons.star,
              iconColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
