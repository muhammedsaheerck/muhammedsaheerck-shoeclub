import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/order/order_provider.dart';
import 'package:shoeclub/infrastructure/order/order_services.dart';
import 'package:shoeclub/presentation/settings/screen_settings.dart';
import 'package:shoeclub/presentation/widgets/bottom_navigation.dart';

import '../../../core/core_datas.dart';

class ScreenMyOrders extends StatelessWidget {
  const ScreenMyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await OrdersApiCall().getAllOrders(context);
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'CHECKOUT',
            style: GoogleFonts.inika(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: CoreDatas.instance.buttonColor,
            ),
          ),
          iconTheme: const IconThemeData(),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ScreenSettings(),
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              )),
        ),
        body: Consumer<OrderProvider>(
          builder: (context, valueProvider, child) => ListView.builder(
            itemCount: valueProvider.orderDetails!.products!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: Image.network(
                          valueProvider.orderDetails!.products![index]!.product!
                              .image!.first!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              " Confirmd",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                // color: CoreDatas.instance.cardColorAlilceBlue
                              ),
                            ),
                            Text(
                              " value.description!",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                // color: CoreDatas.instance.cardColorAlilceBlue
                              ),
                            ),
                            // height10,
                            Text(
                              "₹ {value.price.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
