import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/application/cart/cart_provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';
import 'package:shoeclub/application/whishlist/whishlist_provider.dart';
import 'package:shoeclub/presentation/home/product_details.dart';
import 'package:shoeclub/presentation/splash/widgets/text_ittaliana.dart';
import '../../application/settings/settings_provider.dart';
import '../../core/core_datas.dart';
import 'widgets/carousel_widget.dart';
import 'widgets/dropdown_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final user = sharedPreferences.getString("UserId");
      log("userId-------------${user.toString()}");
      WhishListProvider().userIdGet(user!);
      SharedPreferences sharedPreferencesuserName =
          await SharedPreferences.getInstance();
      final userName = sharedPreferencesuserName.getString("userName");
      await SettingsProvider().userNameGet(userName);
      log(userName!);
      await Provider.of<CartProvider>(context, listen: false).getAllCart();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        leadingWidth: 100,
        backgroundColor: CoreDatas.instance.test,
        leading: Image.asset(
          "asset/logo2.png",
          fit: BoxFit.fill,
          color: Colors.black,
        ),
        title: TextItalianaWidget(
          name: "Shoe Club",
          size: MediaQuery.of(context).size.height * 0.050,
        ),
      ),
      backgroundColor: CoreDatas.instance.test,
      body: ListView(children: [
        CoreDatas.instance.height10,
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<HomeProvider>(
                  builder: (context, valueProvider, child) => TextField(
                    onChanged: (value) {
                      valueProvider.searchaProduct(value);
                    },
                    controller: valueProvider.searchController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      fillColor: CoreDatas.instance.backgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: CoreDatas.instance.buttonColor, fontSize: 18),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: const EdgeInsets.only(left: 2, right: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.13,
              child: const DropdownWidget(),
            ),
          ],
        ),
        CoreDatas.instance.height10,
        const CarouselWidget(),
        CoreDatas.instance.height10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Collection',
            style: GoogleFonts.inika(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        CoreDatas.instance.height10,
        Consumer<HomeProvider>(
          builder: (context, valueprovider, child) => ValueListenableBuilder(
            valueListenable: valueFound,
            builder: (context, valueLi, child) => ListView.builder(
              itemCount: valueFound.value.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: ((context, index) {
                final value = valueFound.value[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.black87,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return ScreenProductDetails(
                                        product: value,
                                      );
                                    }),
                                  ),
                                );
                              },
                              child: Image.network(
                                value!.image!.first!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        value.name!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: CoreDatas
                                                .instance.cardColorAlilceBlue),
                                      ),
                                    ),
                                    Consumer<WhishListProvider>(
                                      builder:
                                          (context, valueProvider, child) =>
                                              Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            await valueProvider.addTOWishlist(
                                                CoreDatas.instance.userId!,
                                                value.id!,
                                                context);
                                          },
                                          child:
                                              valueProvider.searchIdForWishlist(
                                                          value) ==
                                                      true
                                                  ? const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                  : const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                    ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  value.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: CoreDatas
                                          .instance.cardColorAlilceBlue),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ ${value.price.toString()}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: CoreDatas
                                              .instance.cardColorAlilceBlue),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        )
      ]),
    );
  }
}
