import 'dart:ui';

import 'package:character_detail_app/utills/charactor_detail_utills.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite character"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/originals/a5/d6/72/a5d672656c6b6fed6c145673ac686e46.jpg",
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 10.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            // mainAxisExtent: double.infinity,
            childAspectRatio: 0.75,
          ),
          padding: const EdgeInsets.all(8.0), // padding around the grid
          itemCount: favCharacters.length, // total number of items
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(3),
              // color of grid items
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaY: 10,
                            sigmaX: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.03),
                                image: DecorationImage(
                                    image: AssetImage(
                                        favCharacters[index]['image']))),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Character name
                        Text(
                          favCharacters[index]['name'],
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ),
                        // Favourite button
                        IconButton(
                          onPressed: () {
                            favCharacters.contains(favCharacters[index])
                                ? favCharacters.remove(favCharacters[index])
                                : favCharacters.add(favCharacters[index]);
                            setState(() {});
                          },
                          icon: favCharacters.contains(favCharacters[index])
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.amber,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.amber,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
