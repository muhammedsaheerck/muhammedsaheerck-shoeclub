import 'package:flutter/material.dart';
import 'package:shoeclub/core/color.dart';
import 'package:shoeclub/core/sizes.dart';
import 'package:shoeclub/presentation/address/screen_address.dart';

class ScreenProductDetails extends StatelessWidget {
  const ScreenProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: splashColorPlatinum),
          iconTheme: const IconThemeData(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                // color: Colors.amber,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'asset/product4.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Vans Old School",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("₹ 2500",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
              height10,
              const Text(
                "OverView",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              height10,
              const Text(
                  """First known as the Vans #36, the Old Skool debuted in 1977 with a unique new addition: a random doodle drawn by founder Paul Van Doren, and originally referred to as the “jazz stripe.” Today, the famous Vans Sidestripe has become the unmistakable—and instantly recognizable—hallmark of the Vans brand. Constructed with suede uppers and soft Sherpa linings, the Cozy Hug Old Skool pays homage to our heritage while ensuring that this low top, lace-up shoe remains as iconic as ever. It also includes reinforced toe caps, supportive padded collars, and signature rubber waffle outsoles."""),
              height10,
              const Text(
                "Select Size(UK Size)",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvstharSizeWidget(
                    text: '6',
                  ),
                  CircleAvstharSizeWidget(
                    text: '7',
                  ),
                  CircleAvstharSizeWidget(
                    text: '8',
                  ),
                  CircleAvstharSizeWidget(
                    text: '9',
                  ),
                  CircleAvstharSizeWidget(
                    text: '10',
                  ),
                ],
              ),
              height10,
              SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                    onPressed: (() {}),
                    child: const Text("ADD TO BAG")),
              ),
              // height10,
              SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: const Color.fromRGBO(237, 91, 78, 1)),
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => const ScreenAddress())));
                    }),
                    child: const Text("BUY NOW")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvstharSizeWidget extends StatelessWidget {
  final String text;
  const CircleAvstharSizeWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.black,
      radius: 25,
      child: TextButton(
          onPressed: (() {}),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          )),
    );
  }
}
