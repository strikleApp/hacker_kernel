import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/color.dart';
import 'package:hacker_kernel/constants/shared_prefs_keys.dart';
import 'package:hacker_kernel/entity/product.dart';
import 'package:hacker_kernel/repository/provider_function.dart';
import 'package:hacker_kernel/screens/add_product_screen.dart';
import 'package:hacker_kernel/screens/login_screen.dart';
import 'package:hacker_kernel/screens/search_screen.dart';
import 'package:hacker_kernel/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final int count = 41;

  @override
  Widget build(BuildContext context) {
    List<Product> listOfProduct =
        Provider.of<ProviderFunction>(context).productList;
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductScreen()));
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Hi-Fi Shop & Service",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Audio shop on Rustaveli Ave 57.",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: subtitleTextColor),
            ),
            Text(
              "This shop offers both products and services.",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: subtitleTextColor),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  "${listOfProduct.length}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: subtitleTextColor),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Show all",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            listOfProduct.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Text(
                      "No Product Found!",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: listOfProduct.length,
                    itemBuilder: (context, index) {
                      Product product = listOfProduct[index];
                      return ProductCard(
                        imageUrl: product.imagePath,
                        title: product.name,
                        price: product.price.toString(),
                        onDelete: () {
                          Provider.of<ProviderFunction>(context, listen: false)
                              .removeProduct(product: product);
                        },
                      );
                    },
                  ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove(kToken);
                if (context.mounted) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          SizedBox(
            width: 6,
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(cardColor),
              padding: WidgetStatePropertyAll(
                EdgeInsets.all(15),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            onPressed: () {},
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(searchColor),
            padding: WidgetStatePropertyAll(
              EdgeInsets.all(15),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          child: Icon(
            Icons.search,
            size: 22,
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
