import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mr_shop/screen/searchscreen.dart';
import 'package:mr_shop/common/widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageUrl = [
    "https://images.pexels.com/photos/325876/pexels-photo-325876.jpeg?cs=srgb&dl=pexels-pixabay-325876.jpg&fm=jpg",
    "https://t3.ftcdn.net/jpg/01/38/94/62/360_F_138946263_EtW7xPuHRJSfyl4rU2WeWmApJFYM0B84.jpg",
    "https://preview.redd.it/gaming-laptops-the-best-which-one-do-you-have-best-for-a-v0-msl53vqmf4xb1.jpg?width=1080&crop=smart&auto=webp&s=3802cb16df53a9c70d8f75dd710edbbc4d28d1da"
  ];

  int itemTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[700]),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    size: 32,
                    color: Colors.blueGrey[700],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: 32,
                  color: Colors.blueGrey[700],
                )
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // image slider
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ImageSlideshow(
                        indicatorColor: Colors.blue,
                        onPageChanged: (value) {
                          debugPrint('Page changed: $value');
                        },
                        width: double.infinity,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: imageUrl.map((image) {
                          return Image.network(
                            image,
                            fit: BoxFit.cover,
                          );
                        }).toList()),
                  ),
                ),
              ),

              // tabbar item
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(96, 10, 219, 122),
                        spreadRadius: 1,
                        blurRadius: 8,
                      ),
                    ],
                    color: Colors.white),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        indicatorColor: const Color.fromARGB(255, 10, 219, 122),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        labelColor: const Color.fromARGB(255, 10, 219, 122),
                        unselectedLabelColor: Colors.blueGrey,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        tabs: const [
                          Tab(text: "All"),
                          Tab(text: "Fashion"),
                          Tab(text: "Sport"),
                          Tab(text: "Food"),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ProductCard(),
                            ),
                            const Center(
                              child: Text("hell2"),
                            ),
                            const Center(
                              child: Text("hell1"),
                            ),
                            const Center(
                              child: Text("hello"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
