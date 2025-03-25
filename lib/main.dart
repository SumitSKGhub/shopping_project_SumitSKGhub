


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_project/presentation/bloc/cart_bloc.dart';
import 'package:shopping_project/presentation/bloc/product_bloc.dart';
import 'package:shopping_project/presentation/pages/catalogue.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()),
          BlocProvider(create: (context) => CartBloc())
        ],
        child: MaterialApp(
          home: Catelogue_Page(),
        ),
    );
  }
}