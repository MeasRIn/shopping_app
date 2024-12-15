import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int index;
  final Map<String, dynamic> product;
  Set<int> favoriteItems = {};

  ProductDetailScreen({
    super.key,
    required this.index,
    required this.product,
    required this.favoriteItems,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int itemNumber = 0;
  int pickColors = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Detail Product",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.favoriteItems.contains(widget.index)
                          ? widget.favoriteItems.remove(widget.index)
                          : widget.favoriteItems.add(widget.index);
                    });
                  },
                  child: Icon(
                    widget.favoriteItems.contains(widget.index)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: widget.favoriteItems.contains(widget.index)
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Hero(
                tag: 'detailProduct-${widget.index}',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.product['image'],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Title and Price
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$${widget.product['price'].toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Thank you for staying connected! Follow me for insights on web development, Flutter tips, and innovative design ideas. Let’s create impactful digital experiences together. Your support means the world! ",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // choosing colors
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Choose Colors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              pickColors = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.green,
                              border: Border.all(
                                color: pickColors == index
                                    ? const Color.fromARGB(255, 36, 33, 33)
                                    : Colors.white,
                                width: 3,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            // add to cart btn
            SizedBox(height: screenHeight * 0.2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (itemNumber > 0) itemNumber = itemNumber - 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    const Color.fromARGB(255, 211, 214, 208)),
                            child: Center(
                              child: Text(
                                itemNumber.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemNumber += 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 11, 201, 110),
                              ),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color.fromARGB(255, 64, 213, 69),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
