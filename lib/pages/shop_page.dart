import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/shoe_tile.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added to cart'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          )
                        ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'everyone flies.. some fly longer then others',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hot pickes 🔥',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      onTap: () => addShoeToCart(shoe),
                      shoe: shoe,
                    );
                  },
                )),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
