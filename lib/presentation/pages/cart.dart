import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_project/data/models/product_model.dart';
import 'package:shopping_project/presentation/bloc/cart_bloc.dart';
import 'package:shopping_project/presentation/bloc/cart_event.dart';
import 'package:shopping_project/presentation/bloc/cart_state.dart';

class Cart_Page extends StatelessWidget {
  const Cart_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAE1EB),
        title: Text("Cart"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFFFEBEB),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(child: Text("Your cart is empty"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = state.cartItems.keys.elementAt(index);
                    final quantity = state.cartItems[product]!;
                    return _buildCartItem(context, product, quantity);
                  },
                ),
              ),
              Container(
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Amount Price",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "₹${state.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 62,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.pink[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Check Out",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                              if (state.noofItems > 0) // ✅ Only show badge if items are present
                                Positioned(
                                  top: -5,
                                  right: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      state.noofItems.toString(),
                                      style: TextStyle(
                                        color: Colors.pink[400],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    ProductModel product,
    int quantity,
  ) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        minTileHeight: 160,
        leading: Image.network(
          product.thumbnail,
          width: 100,
          height: 100,
          fit: BoxFit.fitHeight,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
            Text(product.brand, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
            Row(
              children: [
                Text(
                  "₹${product.price}  ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  "₹${product.discountedPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${product.discountPercentage}% ",
                  style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "OFF",
                  style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Total: ${(product.discountedPrice * quantity).toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, size: 15),
                        onPressed: () {
                          BlocProvider.of<CartBloc>(
                            context,
                          ).add(UpdateQuantity(product, quantity - 1));
                        },
                      ),
                      Text(quantity.toString(), style: TextStyle(fontSize: 14)),
                      IconButton(
                        icon: Icon(Icons.add, size: 15),
                        onPressed: () {
                          BlocProvider.of<CartBloc>(
                            context,
                          ).add(UpdateQuantity(product, quantity + 1));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
