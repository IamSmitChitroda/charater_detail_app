import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:character_detail_app/utills/charactor_detail_utills.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'favouritepage');
        },
        backgroundColor: Colors.grey.withOpacity(0.5),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.05,
              ),
              // Garena Free fire
              const Text(
                "Garena Free Fire",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  // color: Color(0xfffffff),
                ),
              ),
              SizedBox(
                height: h * 0.15,
              ),
              CarouselSlider(
                items: freeFireCharacters
                    .map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'detailPage',
                                arguments: e,
                              );
                              setState(() {});
                            },
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaY: 10,
                                  sigmaX: 10,
                                ),
                                child: Container(
                                  height: size.height * 0.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Image.asset(
                                    e['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Character name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              //Favourit Icon
                              IconButton(
                                onPressed: () {
                                  favCharacters.contains(e)
                                      ? favCharacters.remove(e)
                                      : favCharacters.add(e);
                                  setState(() {});
                                },
                                icon: favCharacters.contains(e)
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
                    )
                    .toList(),
                options: CarouselOptions(
                  // height: h * 0.5,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInToLinear,
                  aspectRatio: 16 / 50,
                  viewportFraction: 0.8,

                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
