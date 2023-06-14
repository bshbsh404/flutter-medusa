import 'package:art_store/utils/utilities.dart';
import 'package:flutter/material.dart';
import '../models/artModel.dart';

class ArtPrice extends StatelessWidget {
  const ArtPrice({Key? key, required this.art}) : super(key: key);

  final Arts art;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.separated(
        itemCount: art.variants[0].prices.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Row(
            children: [
              Text(art.variants[0].prices[index].currencyCode.toUpperCase()+":",
                  style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(width: 5.0),
              Text('${art.variants[0].prices[index].amount / 100}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kPrimary)
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10.0);
        },
      ),
    );
  }
}