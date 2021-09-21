import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/w1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'THIS IA A HOME PAGE',
                style: GoogleFonts.righteous(fontSize: 33,color: Colors.white),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              title: Text("FLUTTER FOOD"),
              backgroundColor: Colors.black12,
              elevation: 0,

            ),
          )
        ],
      ),
    );
  }
}
