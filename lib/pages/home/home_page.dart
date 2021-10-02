
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
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
                      )
                  ),
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
                                child: Image.asset('assets/images/cat.jpg',fit: BoxFit.cover,),
                              )
                          ),


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
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'Profile'),
              onTap: () {
                _showSubPage(1);
              },
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

class profile_page extends StatelessWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    child: Image.asset('assets/images/cat.jpg',fit: BoxFit.cover,),

                  )
              ),
              Text(
                'Kittithorn Ponpadungkiat',
                style: GoogleFonts.righteous(fontSize: 22, color: Colors.white),
              ),
              Text(
                'PONPADUNGKIAT_K@Silpakorn.edu',
                style:
                    GoogleFonts.righteous(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );

    /*Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 90.0, color: Colors.black),
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
      ),
    )*/
  }
}

class food_menu extends StatefulWidget {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _selectedBottomNavIndex == 0
              ? Text(
                  'FOOD MENU',
                  style: GoogleFonts.righteous(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : Text("Your Order",
                  style: GoogleFonts.righteous(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
        ),
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
        elevation: 0,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
