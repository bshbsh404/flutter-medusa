import 'package:art_store/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/artModel.dart' as model;
import '../screens/ArtDetailScreen.dart';

class ArtCard extends StatelessWidget {
  const ArtCard({Key? key, required this.art}) : super(key: key);

  final model.Arts art;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 140,
        child: GestureDetector(
            onTap: (){
              //Todo: Bring me to the art Details Screen
              Get.to(() => ArtDetails(art: art));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: art.id.toString(),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: kPrimary ),
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: Image.network("http://192.168.197.8:9000${Uri.parse(art.thumbnail).path}")
                        // child:
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                    // padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      art.title,
                      style: TextStyle(
                          color: kBlack, fontWeight: FontWeight.w600),
                      maxLines: 2,
                    )),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("\€${art.variants[0].prices[0].amount / 100}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFB1164),
                        ))),
                const SizedBox(height: 10),
              ],
            )));
  }
}