

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Define a list of coffee items.
  final List<CoffeeItem> coffeeItems = [
    const CoffeeItem(name: 'Espresso', price: 3.00),
    const CoffeeItem(name: 'Americano', price: 3.50),
    const CoffeeItem(name: 'Cappuccino', price: 4.00),
    const CoffeeItem(name: 'Latte', price: 4.50),
    const CoffeeItem(name: 'Mocha', price: 5.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns.
        crossAxisCount: 2,
        // Generate a list of widgets for the grid.
        children: coffeeItems.map((coffeeItem) => CoffeeItemTile(coffeeItem: coffeeItem)).toList(),
      ),
    );
  }
}

// Define a custom widget for each coffee item.
class CoffeeItemTile extends StatelessWidget {
  final CoffeeItem coffeeItem;

  const CoffeeItemTile({Key? key, required this.coffeeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(coffeeItem.name),
        subtitle: Text('\$${coffeeItem.price}'),
        trailing: const Icon(Icons.add),
      ),
    );
  }
}

// Define a class to represent a coffee item.
class CoffeeItem {
  final String name;
  final double price;

  const CoffeeItem({required this.name, required this.price});
}
