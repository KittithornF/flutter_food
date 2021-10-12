import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_page.dart';
import 'package:flutter_food/pages/home/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  static const routeName = '/home';
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: Text(
          _subPageIndex == 0 ? "FOOD" : "PROFILE",
          style: GoogleFonts.righteous(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade900,
                      Colors.blue.shade200,
                      Colors.redAccent.shade100,
                    ],
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                child: Image.asset(
                                  'assets/images/cat.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Text(
                            'Kittithorn Ponpadungkiat',
                            style: GoogleFonts.righteous(
                                fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'PONPADUNGKIAT_K@Silpakorn.edu',
                            style: GoogleFonts.righteous(
                                fontSize: 10.5, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood), 'Food'),
              onTap: () => _showSubPage(0),
              selected: _subPageIndex == 0,
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'Profile'),
              onTap: () {
                _showSubPage(1);
              },
              selected: _subPageIndex == 1,
            ),
          ],
        ),
      ),
      body: _buildSubPage(),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return food_menu();
      case 1:
        return profile_page();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(children: [
      icon,
      SizedBox(width: 8.0),
      Text(
        title,
        style: GoogleFonts.fredokaOne(),
      ),
    ]);
  }
}
