import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourite_app/provider/favourite_provider.dart';
import 'package:provider_favourite_app/screens/selected_fav_items_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite App",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectedFavItemsScreen(),
                  ));
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text(
                        "Item $index",
                      ),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: value.selectedItem.contains(index)
                            ? Colors.red
                            : Colors.grey,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
