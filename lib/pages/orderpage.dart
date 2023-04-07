import 'package:flutter/material.dart';
import 'package:flutter_application_2/datamanager.dart';

import '../datamodel.dart';

class OrderPage extends StatelessWidget {
  final DataManager dataManager;
  const OrderPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataManager.cart.length,
        itemBuilder: (context, index) {
          var item = dataManager.cart[index];
          return OrderItem(
              item: item,
              onRemove: (p) {
                dataManager.cartRemove(p);
              });
        });
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${item.quantity}x"),
                )),
            Expanded(
                flex: 60,
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 20,
                child: Text(
                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}")),
            Expanded(
                flex: 10,
                child: IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      onRemove(item.product);
                    },
                    icon: const Icon(Icons.delete)))
          ],
        ),
      ),
    );
  }
}
