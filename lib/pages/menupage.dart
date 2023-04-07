import 'package:flutter/material.dart';
import 'package:flutter_application_2/datamanager.dart';
import 'package:flutter_application_2/datamodel.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataManager.getMenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //has data
          var categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(categories[index].name),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (context, prodIndex) {
                      var product = categories[index].products[prodIndex];
                      return ProductItem(
                        product: product,
                        onAdd: (addedProduct) {
                          dataManager.cartAdd(addedProduct);
                        },
                      );
                    },
                  )
                ],
              );
            },
          );
        } else {
          //doesn't
          if (snapshot.hasError) {
            return const Text("There have been an error");
          }
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$${product.price}"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: const Text("Add"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
