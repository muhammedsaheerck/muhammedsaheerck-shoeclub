import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenWhishlist extends StatelessWidget {
  const ScreenWhishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: ((context, index) {
              return Card(
                child: Flexible(
                  child: Row(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 20,color: Colors.amber,
                          child: Image.asset(
                            "asset/splash.png", fit: BoxFit.fill,height: 30,width: 30,
                            // width: double.infinity,
                            // height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ),
                        title: const Text(
                          "Nike",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle: const Text("₹ 2500"),
                        trailing: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
