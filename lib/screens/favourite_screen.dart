import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourite_app/provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider =
    //     Provider.of<FavouriteItemProvider>(context, listen: false);

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Favourite App",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
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
                        value.addItem(index);
                      },
                      title: Text(
                        "Item $index",
                      ),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
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
