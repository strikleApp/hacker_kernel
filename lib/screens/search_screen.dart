import 'package:flutter/material.dart';
import 'package:hacker_kernel/constants/color.dart';
import 'package:hacker_kernel/entity/product.dart';
import 'package:hacker_kernel/repository/provider_function.dart';
import 'package:hacker_kernel/widgets/product_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Product> listOfProduct =
        Provider.of<ProviderFunction>(context).productList;
    List<Product> filteredProducts = searchQuery.isEmpty
        ? listOfProduct
        : listOfProduct
            .where((product) =>
                product.name.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
            ),
          ],
        ),
        title: Text('Search Screen'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query; // Update the search query
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredProducts.length,
        // Use filtered products count
        itemBuilder: (context, index) {
          Product product = filteredProducts[index];
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
    );
  }
}
