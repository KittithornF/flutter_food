import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_list_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class food_menu extends StatefulWidget {
  static const routeName = '/menu';
  const food_menu({Key? key}) : super(key: key);

  @override
  _food_menuState createState() => _food_menuState();
}

class _food_menuState extends State<food_menu> {
  @override
  var _selectedBottomNavIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0x44aaaaff),
        elevation: 3,
        unselectedItemColor: Colors.black12,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _selectedBottomNavIndex == 0
              ? FoodListPage()
              : Text("Your Order",
                  style: GoogleFonts.righteous(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
        ),
      ),
    );
  }

  Future<void> _test() async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonbody = json.decode(response.body);
      String status = jsonbody['status'];
      String? message = jsonbody['message'];
      List<dynamic> data = jsonbody['data'];

      data.forEach((element) {
        print('-----Item-----');
        print(element);
      });
    }
  }
}
