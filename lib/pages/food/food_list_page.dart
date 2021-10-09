import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_items.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foodlist';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    Fooditem(id: 1, name: "ข้าวไข่เจียว", price: 980, image: "kao_kai_jeaw.jpg"),
    Fooditem(id: 2, name: "ข้าวหมูแดง", price: 720, image: "kao_moo_dang.jpg"),
    Fooditem(id: 3, name: "ข้าวมันไก่", price: 850, image: "kao_mun_kai.jpg"),
    Fooditem(id: 4, name: "ข้าวหน้าเป็ด", price: 2500, image: "kao_na_ped.jpg"),
    Fooditem(id: 5, name: "ข้าวผัด", price: 900, image: "kao_pad.jpg"),
    Fooditem(id: 6, name: "ผัดซีอิ๊ว", price: 1200, image: "pad_sie_eew.jpg"),
    Fooditem(id: 7, name: "ผัดไทย", price: 1500, image: "pad_thai.jpg"),
    Fooditem(id: 8, name: "ราดหน้า", price: 840, image: "rad_na.jpg"),
    Fooditem(id: 9, name: "ส้มตำไก่ย่าง", price: 4500, image: "som_tum_kai_yang.jpg"),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,

          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goDetail(items[index]);
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 2.0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // if you need this
                  side: BorderSide(
                    color: Colors.black87,
                    width: 3,
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          child: Image.asset('images/${items[index].image}',
                              width: 80.0, height: 80.0, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text('${items[index].name}\n${items[index].price} บาท',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
  void goDetail(Fooditem item) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: item,
    );
  }
}


