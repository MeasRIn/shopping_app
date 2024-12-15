import 'package:flutter/material.dart';
import 'package:mr_shop/common/detail_screen/product_detail_screen.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Map<String, dynamic>> productList = [
    {
      "image":
          "https://img.tatacliq.com/images/i20//437Wx649H/MP000000023725452_437Wx649H_202409200930211.jpeg",
      "title": "Comfort Shoes",
      "price": 100,
      "discount": 10,
    },
    {
      "image":
          "https://drkong.ph/cdn/shop/products/C1003312BUD_7.jpg?v=1696381525",
      "title": " best Shoes",
      "price": 200,
      "discount": 15,
    },
    {
      "image":
          "https://www.jiomart.com/images/product/original/rvszo2sztl/dzvr-men-s-and-boy-s-sports-shoes-for-running-jogging-gym-training-walking-camping-hiking-color-black-_size-uk-7-shoes-for-mens-shoes-for-boys-product-images-rvszo2sztl-5-202211220116.jpg?im=Resize=(500,630)",
      "title": "Sport shoes",
      "price": 300,
      "discount": 20,
    },
    {
      "image":
          "https://jarrods.tech/wp-content/uploads/2023/12/asus-rog-zephyrus-m16-2023-gaming-laptop-1024x576.jpg",
      "title": "Gaming Laptop",
      "price": 1200,
    },
    {
      "image":
          "https://images.lifestyleasia.com/wp-content/uploads/sites/6/2021/10/26205427/sam-moqadam-yxZSAjyToP4-unsplash-scaled-1-1-1275x900.jpg",
      "title": "Food",
      "price": 7.25,
      "discount": 10,
    },
    {
      "image": "https://cdn.kuhl.com/uploads/MS_AKTIVATOR_39c48815a8.jpg",
      "title": "Men's Outdoor Clothing ",
      "price": 27,
    },
  ];

  Set<int> favoriteItems = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //number of column
          crossAxisSpacing: 12, //row spacing
          mainAxisSpacing: 12, //column spacing
          mainAxisExtent: 230, //adjust hight
        ),
        itemCount: productList.length, //number of item
        itemBuilder: (context, index) {
          var product = productList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    index: index,
                    product: productList[index],
                    favoriteItems: favoriteItems,
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'detailProduct-$index',
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 3,
                          color: Colors.green,
                          spreadRadius: 1,
                          offset: Offset(-1, 2)),
                    ]),
                child: Stack(
                  children: [
                    // image
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product['image'].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    product['discount'] == null
                        ? const SizedBox()
                        :
                        // discount

                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              height: 25,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 255, 230, 0),
                              ),
                              child: Center(
                                child: Text(
                                  "${product['discount'].toString()} %",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                    // icon favorite
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 30,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 221, 223, 224),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (favoriteItems.contains(index)) {
                                favoriteItems.remove(index);
                              } else {
                                favoriteItems.add(index);
                              }
                            });
                          },
                          child: Icon(
                            favoriteItems.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: favoriteItems.contains(index)
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),

                    //btn add to cart
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(10)),
                          color: Color.fromARGB(207, 10, 219, 122),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add_outlined,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    //title
                    Positioned(
                      left: 5,
                      bottom: 45,
                      child: Text(
                        product['title'].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // price
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        "${product['price'].toString()} \$",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
