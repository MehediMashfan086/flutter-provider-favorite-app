import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourite_app/provider/favourite_provider.dart';

class SelectedFavItemsScreen extends StatefulWidget {
  const SelectedFavItemsScreen({Key? key}) : super(key: key);

  @override
  State<SelectedFavItemsScreen> createState() => _SelectedFavItemsScreenState();
}

class _SelectedFavItemsScreenState extends State<SelectedFavItemsScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final selectedItemProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Selected Favourite Items",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedItemProvider.selectedItem.length,
              itemBuilder: (context, index) {
                int itemIndex = selectedItemProvider.selectedItem[index];
                return ListTile(
                  onTap: () {
                    selectedItemProvider.removeItem(itemIndex);
                  },
                  title: Text(
                    "Item $itemIndex",
                  ),
                  trailing: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
