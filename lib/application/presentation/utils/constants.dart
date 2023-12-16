import 'dart:math';

import 'package:zikrabyte_ui/application/presentation/utils/colors.dart';
import 'package:zikrabyte_ui/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double sHeight = 850;
double sWidth = 350;

const kEmpty = SizedBox();

const kHeight5 = SizedBox(height: 5);
const kHeight10 = SizedBox(height: 10);
const kHeight20 = SizedBox(height: 20);
const kHeight30 = SizedBox(height: 30);
const kHeight50 = SizedBox(height: 50);

const kWidth5 = SizedBox(width: 5);
const kWidth10 = SizedBox(width: 10);
const kWidth20 = SizedBox(width: 20);
const kWidth30 = SizedBox(width: 30);
const kWidth50 = SizedBox(width: 50);

const kRadius5 = Radius.circular(5);
const kRadius10 = Radius.circular(10);
const kRadius20 = Radius.circular(20);
const kRadius50 = Radius.circular(50);

void sizeFinder(BuildContext context) {
  final size = MediaQuery.of(context).size;
  sHeight = size.height;
  sWidth = size.width;
}

TextStyle cabin(
    {double fontSize = 0.035,
    FontWeight fontWeight = FontWeight.normal,
    Color color = kBlack}) {
  return GoogleFonts.cabin(
      fontSize: fontSize * sWidth, fontWeight: fontWeight, color: color);
}

TextStyle montserrat(
    {double fontSize = 0.035,
    FontWeight fontWeight = FontWeight.normal,
    Color color = kBlack}) {
  return GoogleFonts.montserrat(
      fontSize: fontSize * sWidth, fontWeight: fontWeight, color: color);
}

List<Item> items = [];

void createItems() {
  
  Random().nextInt(3);
  for (int i = 0; i < groceryList.length; i++) {
    final Item item = Item(
        image: groceryList[i].first,
        ingredients: groceryList[i][2],
        name: groceryList[i][1],
        price: int.parse(groceryList[i][3]));
        items.add(item);
  }
}
List<String> catogeryFood=['Chicken','Sushi','Noodles','Salad','Beef','Pizza','Burger','Rice','Cake','Soup','seafood','Bread','Chicken','Sushi','Noodles','Salad','Beef','Pizza','Burger','Rice','Cake','Soup','seafood','Bread'];
List<String> itemsFoodCatogery=['Chicken Soup','Sushi Chicken','Chicken Noodles','Chicken Salad','Chicken Cutlite','Chicken Pizza','Chicken Burger','Chicken Rice','ChickenSoup','Chicken Bread','Chicken Soup','Sushi Chicken','Chicken Noodles','Chicken Salad','Chicken Cutlite','Chicken Pizza','Chicken Burger','Chicken Rice','ChickenSoup','Chicken Bread'];
List<String> country = [
  'Korean',
  'Australian',
  'American',
  'Mexican',
  'French',
  'Brazilian',
  'Neigrian',
  'Italian',
  'Chinese',
  'Indian',
  'Korean',
  'Australian',
  'American',
  'Mexican',
  'French',
  'Brazilian',
];
List<String> imagesList = [
  'assets/images/category1.jpeg',
  'assets/images/category2.jpeg',
  'assets/images/category3.jpeg',
  'assets/images/category4.jpeg',
  'assets/images/category5.jpeg',
  'assets/images/category6.jpeg',
  'assets/images/category7.jpeg',
  'assets/images/category8.jpeg',
  'assets/images/category9.jpeg',
  'assets/images/category10.jpeg',
  'assets/images/category2.jpeg',
  'assets/images/category3.jpeg',
  'assets/images/category4.jpeg',
  'assets/images/category5.jpeg',
  'assets/images/category6.jpeg',
  'assets/images/category7.jpeg',
  'assets/images/category8.jpeg',
  'assets/images/category9.jpeg',
];

List<List<String>> groceryList = [
  [
    'assets/images/category1.jpeg',
    'Yangnyeom Chicken',
    '5/12 ingredients ',
    '400'
        ''
  ],
  [
    'assets/images/category2.jpeg',
    'Sandwich with boiled egg',
    '10/10 ingredients ',
    '550',
        'mark'
  ],
  [
    'assets/images/category3.jpeg',
    'Spicy Chicken Burger',
    '8/8 ingredients ',
    '350',
    'mark'
  ],
  [
    'assets/images/category4.jpeg',
    'Fruit Nut Salad',
    '13/13 ingredients ',
    '670',
    'mark'
  ],
  [
    'assets/images/category5.jpeg',
    'Fruit blueberry toast',
    '12/12 ingredients ',
    '780',
    ''
  ],
  [
    'assets/images/category6.jpeg',
    'Hot Sauce Stake',
    '15/15 ingredients ',
    '500',
    ''
  ],
 [
    'assets/images/category1.jpeg',
    'Yangnyeom Chicken',
    '5/12 ingredients ',
    '400'
        ''
  ],
  [
    'assets/images/category2.jpeg',
    'Sandwich with boiled egg',
    '10/10 ingredients ',
    '550',
        'mark'
  ],
  [
    'assets/images/category3.jpeg',
    'Spicy Chicken Burger',
    '8/8 ingredients ',
    '350',
    'mark'
  ],
  [
    'assets/images/category4.jpeg',
    'Fruit Nut Salad',
    '13/13 ingredients ',
    '670',
    'mark'
  ],
  [
    'assets/images/category5.jpeg',
    'Fruit blueberry toast',
    '12/12 ingredients ',
    '780',
    ''
  ]
];
