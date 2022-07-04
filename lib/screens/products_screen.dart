import 'package:ecommerce_admin/controllers/product_controller.dart';
import 'package:ecommerce_admin/models/product_models.dart';
import 'package:ecommerce_admin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Product"),
        backgroundColor: Colors.black87,
        onPressed: () {
          Get.to(() => NewProductScreen());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          Expanded(
            child: Obx(
              () => (ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 210,
                    child: ProductCard(
                      product: productController.products[index],
                      index: index,
                    ),
                  );
                },
              )),
            ),
          )
        ]),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.description,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "RM ${product.price.toStringAsFixed(1)}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      value: product.price,
                      min: 0,
                      max: 25,
                      divisions: 10,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        productController.updateProductPrice(
                            index, product, value);
                      },
                      onChangeEnd: (value) {
                        productController.saveNewProductPrice(
                            product, "price", value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${product.quantity.toInt()}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      value: product.quantity.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        productController.updateProductQuantity(
                            index, product, value.toInt());
                      },
                      onChangeEnd: (value) {
                        productController.saveNewProductQuantity(
                            product, "quantity", value.toInt());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
