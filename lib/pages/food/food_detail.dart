import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_items.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetail extends StatefulWidget {
  static const routeName = '/detail';
  const FoodDetail({Key? key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as Fooditem;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.deepPurpleAccent,
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Image.asset('images/${item.image}',fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("$item" ,style: GoogleFonts.mali(fontSize: 30,color: Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }
}
