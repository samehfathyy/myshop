import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/cubit/loadproducts_cubit.dart';
import 'package:myshop/cubit/loadproducts_state.dart';
import 'package:myshop/widgets/product_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 30,
                  child: Image.asset("assets/images/m.png"),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'ax',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      //letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                )),
          ],
        ),
        backgroundColor: Colors.grey.shade50,
      ),
      body: BlocBuilder<LoadProductsCubit, LoadProductsState>(
        builder: (context, state) {
          if (state is LoadProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadProductsLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 0.65, // Adjust to control item height
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: state.products[index]);
              },
              itemCount: state.products.length,
            );
          }
          if (state is LoadProductsError) {
            return Text(state.message);
          }
          return const Text('failed');
        },
      ),
    );
  }
}
