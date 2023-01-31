import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import '../../../domain/modal/product/product_modal.dart';

class ImageChange extends StatelessWidget {
  final int index;
  final Product product;
  const ImageChange({Key? key, required this.index, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          value.selectedImage(index);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.only(left: 2, right: 5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width * 0.13,
          child: Image.network(
            product.image![index]!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
