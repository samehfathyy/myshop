import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myshop/cubit/loadproducts_cubit.dart';
import 'package:myshop/cubit/loadproducts_state.dart';
import 'package:myshop/screens/Cart_screen.dart';
import 'package:myshop/screens/Favorite_screen.dart';
import 'package:myshop/screens/Home_screen.dart';
import 'package:myshop/screens/Profile_screen.dart';
import 'package:myshop/widgets/navbar.dart';
import 'package:myshop/widgets/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LoadProductsCubit(),
        child: Start(),
      ),
    );
  }
}

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  void onItemTapped(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    String productsendpoint = 'products/';
    String productscategoriesendpoint = 'products/categories';
    context.read<LoadProductsCubit>().loadProducts(productsendpoint);
    //context.read<LoadProductsCubit>().loadProducts(productscategoriesendpoint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: [
              Homescreen(),
              FavoriteScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
            controller: pageController,
            onPageChanged: (value) {
              selectedIndex = value;
            },
          ),
          Navbar(
            onItemTapped: onItemTapped,
          )
        ],
      ),
      // bottomNavigationBar: Navbar(
      //   onItemTapped: onItemTapped,
      // ),
    );
  }
}
