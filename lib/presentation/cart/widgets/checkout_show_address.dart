import 'package:flutter/material.dart';

import '../../../core/core_datas.dart';
import '../../../domain/modal/address/address_modal.dart';

class CheckoutAddressShow extends StatelessWidget {
  const CheckoutAddressShow({
    super.key,
    required this.address,
  });

  final AddressElements address;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.deepPurple.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              address.fullName!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.phone!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.address!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.place!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.state!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.pin!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            CoreDatas.instance.height5,
            Text(
              overflow: TextOverflow.ellipsis,
              address.landMark!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
