import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class profile_page extends StatelessWidget {
  static const routeName = '/profile';
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


  }
}