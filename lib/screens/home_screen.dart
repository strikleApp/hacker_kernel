import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/color.dart';
import 'package:hacker_kernel/screens/add_product_screen.dart';
import 'package:hacker_kernel/widgets/accessories_card.dart';
import 'package:hacker_kernel/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final int count = 41;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductScreen()));
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
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
                    "$count",
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.24,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imageUrl: "assets/login.png",
                      title: "Headphone",
                      price: "477",
                      onDelete: () {},
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Accessories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "$count",
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
                height: MediaQuery.sizeOf(context).height * 0.27,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return AccessoriesCard(
                      isAvailable: index % 2 == 0 ? true : false,
                      imageUrl: "assets/login.png",
                      title: "Headphone",
                      price: "477",
                      onDelete: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
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
          onPressed: () {},
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
