import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
        Offer(
            name: "The greatest Coffee",
            description: "i swear i can stop whenever i want"),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String name;
  final String description;
  const Offer({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/background.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
