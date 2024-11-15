import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshop/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: (screenwidth - 30) / 2,
              width: (screenwidth - 30) / 2,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(widget.product.image.toString()),
                  )),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.circle,
                            size: 36,
                            color: favorite
                                ? Colors.grey.withOpacity(0.4)
                                : Colors.grey.withOpacity(0.6),
                          )),
                      IconButton(
                          onPressed: () {
                            favorite = !favorite;
                            setState(() {});
                          },
                          icon: Icon(
                            favorite ? Icons.favorite : Icons.favorite_border,
                            size: 22,
                            color: favorite ? Colors.red : Colors.white,
                          )),
                    ],
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 8.0, right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title.toString(),
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Outfit',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1.2),
                  //textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                Text(
                  '\$${widget.product.price.toString()}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Outfit',
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
