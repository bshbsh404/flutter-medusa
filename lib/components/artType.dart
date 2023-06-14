import 'package:art_store/utils/utilities.dart';
import 'package:flutter/material.dart';
import '../models/artModel.dart';

class ArtType extends StatelessWidget {
  ArtType({Key? key, required this.art}) : super(key: key);

  final Arts art;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Text('Embroidery Type',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(width: 20),
            ...List.generate(
                art.variants.length,
                    (index) => Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: kPrimaryLight,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Center(
                          child: Text(
                            art.variants[index].title,
                            style: TextStyle(color: kWhite),
                          )),
                    ))),
          ],
        ),
      ),
    );
  }
}