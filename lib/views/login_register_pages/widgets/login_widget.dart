import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/categories.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/models/product_model.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';
import 'input_widget.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    var jsonn = [
      {
        "name": "Fruits",
        "image": "https://cdn-icons-png.flaticon.com/512/2843/2843568.png",
        "items": [
          {
            "id": 1,
            "name": "Watermelon",
            "weight": "2kg",
            "price": 8.98,
            "image": "https://cdn-icons-png.flaticon.com/512/3860/3860174.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 2,
            "name": "Banana",
            "weight": "1kg",
            "price": 49.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2909/2909761.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 3,
            "name": "Mango",
            "weight": "1kg",
            "price": 19.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6866/6866538.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 4,
            "name": "Kiwi",
            "weight": "1kg",
            "price": 79.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1135/1135602.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 5,
            "name": "Apples",
            "weight": "1kg",
            "price": 39.95,
            "image": "https://cdn-icons-png.flaticon.com/512/415/415682.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 6,
            "name": "Pineapple",
            "weight": "1kg",
            "price": 49.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6866/6866518.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 7,
            "name": "Cherry",
            "weight": "1kg",
            "price": 129.95,
            "image": "https://cdn-icons-png.flaticon.com/512/4977/4977391.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 8,
            "name": "Grapes",
            "weight": "1kg",
            "price": 12.45,
            "image": "https://cdn-icons-png.flaticon.com/512/8043/8043515.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 9,
            "name": "Pomegranate",
            "weight": "1kg",
            "price": 9.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6866/6866548.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 10,
            "name": "Oranges",
            "weight": "2kg",
            "price": 37.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1728/1728765.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          }
        ]
      },
      {
        "name": "Vegetables",
        "image": "https://cdn-icons-png.flaticon.com/512/2329/2329865.png",
        "items": [
          {
            "id": 11,
            "name": "Tomatoes",
            "weight": "1kg",
            "price": 8.95,
            "image": "https://cdn-icons-png.flaticon.com/512/4264/4264717.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 12,
            "name": "Potatoes",
            "weight": "1kg",
            "price": 9.8,
            "image": "https://cdn-icons-png.flaticon.com/512/6931/6931869.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 13,
            "name": "Onions",
            "weight": "1kg",
            "price": 2.95,
            "image": "https://cdn-icons-png.flaticon.com/512/5009/5009842.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 14,
            "name": "Carrots",
            "weight": "1kg",
            "price": 8.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1041/1041355.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 15,
            "name": "Yellow Bell Pepper",
            "weight": "1kg",
            "price": 16.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2909/2909848.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 16,
            "name": "Sweet Potatoes",
            "weight": "1kg",
            "price": 16.95,
            "image": "https://cdn-icons-png.flaticon.com/512/4278/4278227.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 17,
            "name": "Zucchini",
            "weight": "1kg",
            "price": 18.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1514/1514958.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 18,
            "name": "Red Bell Pepper",
            "weight": "1kg",
            "price": 16.95,
            "image": "https://cdn-icons-png.flaticon.com/512/810/810597.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 19,
            "name": "Green Bell Pepper",
            "weight": "1kg",
            "price": 9.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2909/2909767.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 20,
            "name": "Eggplants",
            "weight": "1kg",
            "price": 3.95,
            "image": "https://cdn-icons-png.flaticon.com/512/766/766026.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          }
        ]
      },
      {
        "name": "Snacks",
        "image": "https://cdn-icons-png.flaticon.com/512/2553/2553691.png",
        "items": [
          {
            "id": 21,
            "name": "Chips",
            "weight": "42g",
            "price": 2.95,
            "image": "https://cdn-icons-png.flaticon.com/512/305/305385.png",
            "description":
                "Our chips is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 22,
            "name": "Toasties",
            "weight": "38g",
            "price": 5.25,
            "image": "https://cdn-icons-png.flaticon.com/512/3050/3050217.png",
            "description":
                "Our toasties is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 23,
            "name": "Popcorn",
            "weight": "60g",
            "price": 9.25,
            "image": "https://cdn-icons-png.flaticon.com/512/3418/3418886.png",
            "description":
                "Our popcorn is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 24,
            "name": "Chocolate",
            "weight": "90g",
            "price": 21.95,
            "image": "https://cdn-icons-png.flaticon.com/512/3465/3465221.png",
            "description":
                "Our chocolate is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 25,
            "name": "Mini Chocolate",
            "weight": "90g",
            "price": 10.6,
            "image": "https://cdn-icons-png.flaticon.com/512/7627/7627667.png",
            "description":
                "Our mini chocolate is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 26,
            "name": "Jelly",
            "weight": "20g",
            "price": 4.5,
            "image": "https://cdn-icons-png.flaticon.com/512/1398/1398525.png",
            "description":
                "Our jelly is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 27,
            "name": "Gum",
            "weight": "10pcs",
            "price": 4.5,
            "image": "https://cdn-icons-png.flaticon.com/512/1075/1075914.png",
            "description":
                "Our gum is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 28,
            "name": "Jelly Cola",
            "weight": "25g",
            "price": 4.5,
            "image": "https://cdn-icons-png.flaticon.com/512/6097/6097990.png",
            "description":
                "Our jelly cola is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 29,
            "name": "Chocolate Truffles",
            "weight": "200g",
            "price": 91.85,
            "image": "https://cdn-icons-png.flaticon.com/512/6773/6773707.png",
            "description":
                "Our chocolate truffles is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          },
          {
            "id": 30,
            "name": "Halls Menthol",
            "weight": "25g",
            "price": 4.7,
            "image": "https://cdn-icons-png.flaticon.com/512/1553/1553039.png",
            "description":
                "Our halls menthol is an ideal snacking option for you and your family. It offers a perfect balance of flavor and taste that satiate your taste buds. You can enjoy this crunchy snack while watching a movie or reading a book for fulfilling your hunger pangs."
          }
        ]
      },
      {
        "name": "Beverages",
        "image": "https://cdn-icons-png.flaticon.com/512/3050/3050130.png",
        "items": [
          {
            "id": 31,
            "name": "Ground Coffee",
            "weight": "200g",
            "price": 121.0,
            "image": "https://cdn-icons-png.flaticon.com/512/2302/2302566.png",
            "description":
                "Start your day straight with the first sip of this classic, which awakens your senses to new opportunities."
          },
          {
            "id": 32,
            "name": "Instant Coffee",
            "weight": "20g",
            "price": 2.5,
            "image": "https://cdn-icons-png.flaticon.com/512/6694/6694896.png",
            "description":
                "Premium foamy instant coffee straight at home, a must-try for all coffee lovers."
          },
          {
            "id": 33,
            "name": "Orange Juice",
            "weight": "1L",
            "price": 9.75,
            "image": "https://cdn-icons-png.flaticon.com/512/2442/2442019.png",
            "description":
                "Orange Juice is rich in delicious fruit taste, produced from the finest ingredients rich in vitamin C, making it the best choice among consumers."
          },
          {
            "id": 34,
            "name": "Apple Juice",
            "weight": "1L",
            "price": 9.75,
            "image": "https://cdn-icons-png.flaticon.com/512/571/571493.png",
            "description":
                "It has been developed to be your great tasting healthy habit, making it easy for you to do some good to your health."
          },
          {
            "id": 35,
            "name": "Strawberry Smoothie",
            "weight": "1L",
            "price": 19.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2405/2405470.png",
            "description":
                "It has been developed to be your great tasting healthy habit, making it easy for you to do some good to your health."
          },
          {
            "id": 36,
            "name": "Sparkling Water",
            "weight": "1L",
            "price": 6.25,
            "image": "https://cdn-icons-png.flaticon.com/512/2070/2070170.png",
            "description":
                "The bright taste of this sparkling water beverage is ideal for a classic drinking sensation or as an elegant mixer."
          },
          {
            "id": 37,
            "name": "Soft Drink",
            "weight": "970mL",
            "price": 10.75,
            "image": "https://cdn-icons-png.flaticon.com/512/659/659385.png",
            "description":
                "The Soda is sure to motivate to keep hydrated. This sparkling water is made by added minerals to boost overall health. This soda has versatile applications and keeps hydrated for an extended period. This soda may also help with digestion and improve oral health."
          },
          {
            "id": 38,
            "name": "Tea",
            "weight": "250g",
            "price": 30.25,
            "image": "https://cdn-icons-png.flaticon.com/512/3504/3504837.png",
            "description":
                "Give your mornings a refreshing start with our Instant Tea. It is made from carefully sourced Tea to ensure the perfect taste and flavour in every sip. The delicious taste and refreshing aroma make this Tea stand out. It easily and quickly mixes with milk or water to give you a rich colour. It is sure to put you in a better mood instantly, no matter if it is day or night. You can relish a cup during late-night meetings, a perfect accompaniment while reading a book or for kick-starting the day in the right way."
          },
          {
            "id": 39,
            "name": "Bubble Tea",
            "weight": "250g",
            "price": 60.25,
            "image": "https://cdn-icons-png.flaticon.com/512/3081/3081162.png",
            "description":
                "Give your mornings a refreshing start with our Instant Tea. It is made from carefully sourced Tea to ensure the perfect taste and flavour in every sip. The delicious taste and refreshing aroma make this Tea stand out. It easily and quickly mixes with milk or water to give you a rich colour. It is sure to put you in a better mood instantly, no matter if it is day or night. You can relish a cup during late-night meetings, a perfect accompaniment while reading a book or for kick-starting the day in the right way."
          },
          {
            "id": 40,
            "name": "Mineral Water",
            "weight": "18.9L",
            "price": 33.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1651/1651824.png",
            "description":
                "Our mineral water combines filtration with added minerals to create a fresh, clean, and premium tasting water that is pure and delicious."
          }
        ]
      },
      {
        "name": "Dairy & Eggs",
        "image": "https://cdn-icons-png.flaticon.com/512/2674/2674486.png",
        "items": [
          {
            "id": 41,
            "name": "Milk",
            "weight": "1.5L",
            "price": 24.45,
            "image": "https://cdn-icons-png.flaticon.com/512/3500/3500270.png",
            "description":
                "Energize your every morning with the our Full Cream Milk. It is an excellent addition to your healthy diet, whose every sip is stacked with pure delight and pleasure. This milk is a rich source of calcium and protein that not only promotes healthy wellbeing but also balances out your diet. Also, it can be enjoyed on its own or by using it with other meals."
          },
          {
            "id": 42,
            "name": "Yogurt",
            "weight": "105g",
            "price": 27.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2689/2689439.png",
            "description":
                "Energize your every morning with the our Full Cream Yogurt. It is an excellent addition to your healthy diet, whose every spoon is stacked with pure delight and pleasure. This yogurt is a rich source of calcium and protein that not only promotes healthy wellbeing but also balances out your diet. Also, it can be enjoyed on its own or by using it with other meals."
          },
          {
            "id": 43,
            "name": "Cheese",
            "weight": "1kg",
            "price": 133.95,
            "image": "https://cdn-icons-png.flaticon.com/512/517/517561.png",
            "description":
                "We offer you a broad variety of cheese and cold cuts from all the brands you trust, stored in our high-tech refrigerators which keeps their original taste for long. Just think of how you like your breakfast sandwich, easily choose your favorite products with the desired weight; and have it delivered to you at the comfort of your own home."
          },
          {
            "id": 44,
            "name": "Eggs",
            "weight": "30pcs",
            "price": 66.95,
            "image": "https://cdn-icons-png.flaticon.com/512/1046/1046774.png",
            "description":
                "It helps to boost memory power and contains nutrition like Choline, Selenium and Lutein that are essential for brain development and eye vision."
          },
          {
            "id": 45,
            "name": "Butter",
            "weight": "400gm",
            "price": 95.55,
            "image": "https://cdn-icons-png.flaticon.com/512/2366/2366403.png",
            "description":
                "Delicious spread, an essential ingredient of baking and a known enhancer for many food items."
          },
          {
            "id": 46,
            "name": "Pudding",
            "weight": "100gm",
            "price": 33.95,
            "image": "https://cdn-icons-png.flaticon.com/512/590/590740.png",
            "description":
                "Enjoy the goodness of milk and its rich, velvety texture in the form of the Pudding. It is a delightful breakfast dessert in sweet caramel flavor to feed the entire family with a dose of essential nutrients."
          },
          {
            "id": 47,
            "name": "Greek Yogurt",
            "weight": "140gm",
            "price": 12.75,
            "image": "https://cdn-icons-png.flaticon.com/512/6476/6476100.png",
            "description":
                "Energize your every morning with the our Greek Yogurt. It is an excellent addition to your healthy diet, whose every spoon is stacked with pure delight and pleasure. This yogurt is a rich source of calcium and protein that not only promotes healthy wellbeing but also balances out your diet. Also, it can be enjoyed on its own or by using it with other meals."
          },
          {
            "id": 48,
            "name": "Yogurt Drink",
            "weight": "420ml",
            "price": 9.25,
            "image": "https://cdn-icons-png.flaticon.com/512/7627/7627502.png",
            "description":
                "Energize your every morning with the our Yogurt Drink. It is an excellent addition to your healthy diet, whose every spoon is stacked with pure delight and pleasure. This yogurt is a rich source of calcium and protein that not only promotes healthy wellbeing but also balances out your diet. Also, it can be enjoyed on its own or by using it with other meals."
          },
          {
            "id": 49,
            "name": "Cooking Cream",
            "weight": "500ml",
            "price": 42.95,
            "image": "https://cdn-icons-png.flaticon.com/512/7752/7752995.png",
            "description":
                "Enjoy the goodness of milk and its rich, velvety texture in the form of the Pudding. It is a delightful breakfast dessert in sweet caramel flavor to feed the entire family with a dose of essential nutrients."
          },
          {
            "id": 50,
            "name": "Margarine",
            "weight": "200gm",
            "price": 52.05,
            "image": "https://cdn-icons-png.flaticon.com/512/5071/5071259.png",
            "description":
                "Delicious spread, an essential ingredient of baking and a known enhancer for many food items."
          }
        ]
      },
      {
        "name": "Herbs, Spices & Seasoning",
        "image": "https://cdn-icons-png.flaticon.com/512/616/616576.png",
        "items": [
          {
            "id": 51,
            "name": "Dill",
            "weight": "50gm",
            "price": 1.5,
            "image": "https://cdn-icons-png.flaticon.com/512/7231/7231007.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 52,
            "name": "Celery",
            "weight": "50gm",
            "price": 7.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6108/6108992.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 53,
            "name": "Watercress",
            "weight": "100gm",
            "price": 2.75,
            "image": "https://cdn-icons-png.flaticon.com/512/6931/6931916.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 54,
            "name": "Basil",
            "weight": "100gm",
            "price": 7.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6409/6409368.png",
            "description":
                "Our wide assortment of meticulously hand-picked fruits and vegetables are stored each in their own suitable conditions; which ensures you to experience our high-quality fresh products. Whether you prefer imported or local products, Carrefour offers you wide ranges of healthy choices to choose from."
          },
          {
            "id": 55,
            "name": "Table Salt",
            "weight": "700gm",
            "price": 5.8,
            "image": "https://cdn-icons-png.flaticon.com/512/736/736923.png",
            "description": "Perfect for adding flavour to your daily meals."
          },
          {
            "id": 56,
            "name": "Spices Mix",
            "weight": "40gm",
            "price": 5.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2160/2160302.png",
            "description": "Perfect for adding flavour to your daily meals."
          },
          {
            "id": 57,
            "name": "Black Pepper",
            "weight": "45gm",
            "price": 13.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6378/6378180.png",
            "description": "Perfect for adding flavour to your daily meals."
          },
          {
            "id": 58,
            "name": "Cumin",
            "weight": "1kg",
            "price": 129.95,
            "image": "https://cdn-icons-png.flaticon.com/512/4788/4788088.png",
            "description": "Perfect for adding flavour to your daily meals."
          },
          {
            "id": 59,
            "name": "Lentils",
            "weight": "1kg",
            "price": 38.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2165/2165967.png",
            "description": "Perfect for adding flavour to your daily meals."
          },
          {
            "id": 60,
            "name": "Paprika",
            "weight": "1kg",
            "price": 139.95,
            "image": "https://cdn-icons-png.flaticon.com/512/6332/6332497.png",
            "description": "Perfect for adding flavour to your daily meals."
          }
        ]
      },
      {
        "name": "Oils, Vinegar & Salad Dressings",
        "image": "https://cdn-icons-png.flaticon.com/512/4264/4264676.png",
        "items": [
          {
            "id": 61,
            "name": "Vinegar",
            "weight": "1L",
            "price": 10.45,
            "image": "https://cdn-icons-png.flaticon.com/512/123/123309.png",
            "description":
                "Our Vinegar is natural and stands out because of its ideal taste profile. It also has antiseptic and disinfectant qualities that significantly extend its uses."
          },
          {
            "id": 62,
            "name": "White Vinegar",
            "weight": "1L",
            "price": 10.45,
            "image": "https://cdn-icons-png.flaticon.com/512/123/123309.png",
            "description":
                "Our Vinegar is natural and stands out because of its ideal taste profile. It also has antiseptic and disinfectant qualities that significantly extend its uses."
          },
          {
            "id": 63,
            "name": "Tahini",
            "weight": "505g",
            "price": 41.65,
            "image": "https://cdn-icons-png.flaticon.com/512/2612/2612753.png",
            "description":
                "It is a tasty way to add powerful antioxidants and healthy fats to your diet"
          },
          {
            "id": 64,
            "name": "Mustard",
            "weight": "235g",
            "price": 22.35,
            "image": "https://cdn-icons-png.flaticon.com/512/135/135606.png",
            "description": "Sweetness with a strong mustard bite."
          },
          {
            "id": 65,
            "name": "Mayonnaise",
            "weight": "310g",
            "price": 31.35,
            "image": "https://cdn-icons-png.flaticon.com/512/4832/4832654.png",
            "description":
                "Our Classic Mayonnaise a generous splash of stokes to spice up any recipe, Made from the finest ingredients to give you a rich flavour."
          },
          {
            "id": 66,
            "name": "Ketchup",
            "weight": "285g",
            "price": 18.9,
            "image": "https://cdn-icons-png.flaticon.com/512/877/877824.png",
            "description":
                "Our Tomato Ketchup is made with 100% real, naturally ripened fresh Tomatoes."
          },
          {
            "id": 67,
            "name": "Hot Sauce",
            "weight": "165g",
            "price": 16.2,
            "image": "https://cdn-icons-png.flaticon.com/512/3040/3040047.png",
            "description":
                "Our Premium Hot Sauce to you the basic age-old Red Pasta Sauce. It is a basic tomato-based sauce that is made with tomatoes, garlic, crushed red pepper, and basil. It is a very simple sauce yet is rich in flavour."
          },
          {
            "id": 68,
            "name": "BBQ Sauce",
            "weight": "200g",
            "price": 13.95,
            "image": "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            "description":
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
          },
          {
            "id": 69,
            "name": "Salad Dressing",
            "weight": "500g",
            "price": 29.45,
            "image": "https://cdn-icons-png.flaticon.com/512/2674/2674069.png",
            "description":
                "This perfect blend of spices transferred in a salad dressing is very appealing to the taste buds and offer a lip smacking experience."
          },
          {
            "id": 70,
            "name": "Apple Cider Vinegar",
            "weight": "300ml",
            "price": 37.5,
            "image": "https://cdn-icons-png.flaticon.com/512/1206/1206330.png",
            "description":
                "Our Vinegar is natural and stands out because of its ideal taste profile. It also has antiseptic and disinfectant qualities that significantly extend its uses."
          }
        ]
      }
    ];
    List<Category> data = DataFromJson(json.encode(jsonn));

    Future addProducts() async {
      CollectionReference addCat =
          FirebaseFirestore.instance.collection('categories');

      data.forEach((element) async {
        var result = await addCat.add({
          'name': element.name,
          "image": element.image,
          'items': element.items.map(
            (item) {
              return {
                "id": item.id,
                "name": item.name,
                "weight": item.weight,
                "price": item.price,
                "image": item.image,
                "description": item.description,
              };
            },
          ).toList(),
        });
      });
    }

    void _login() async {
      await authService.signIn(emailController.text, passController.text);
      await addProducts();
    }

    return Column(children: [
      Form(
        key: _key,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputWidget(emailController, 'Email', 'Email cannot be empty'),
              InputWidget(
                  passController, 'Password', 'Password cannot be empty'),
              ButtonWidget('Forgot Password?'),
            ]),
      ),
      ElevatedButtonWidget('Login', _login),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(title: 'Don\'t have any account?'),
          TextButton(
            child: TextWidget(
              title: 'Create one',
              font: 20,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    ]);
  }
}
