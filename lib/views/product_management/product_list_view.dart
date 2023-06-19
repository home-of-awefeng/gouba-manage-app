import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Entry ${index}')),
          );
        }
    );
  }
}