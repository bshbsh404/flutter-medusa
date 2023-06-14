import 'package:art_store/components/artType.dart';
import 'package:art_store/components/artPrice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/artModel.dart' as model;
import '../utils/utilities.dart';

class ArtCardDetails extends StatefulWidget {
  const ArtCardDetails({Key? key, required this.art}) : super(key: key);
  final model.Arts art;
  @override
  _ArtCardDetailsState createState() => _ArtCardDetailsState();
}

class _ArtCardDetailsState extends State<ArtCardDetails> {
  int selectedImageView = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: Get.width,
              // height: Get.height * 0.35,
              child: Hero(
                  tag: widget.art.id,
                  child: Image.network("http://192.168.197.8:9000${Uri.parse(widget.art.images[selectedImageView].url).path}", fit: BoxFit.cover)

              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.art.images.length, (index) => artReview(index)),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
              child: Text(widget.art.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24))),
          ArtPrice(art: widget.art),
          const SizedBox(height: 5.0),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Art Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          const SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(widget.art.description,
                  style: const TextStyle(fontSize: 18, color: Colors.grey))),
          const SizedBox(height: 10.0),
          ArtType(art: widget.art),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  GestureDetector artReview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedImageView = index);
      },
      child: Container(
          margin: const EdgeInsets.only(right: 15, top: 15),
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8, bottom: 8),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: selectedImageView == index
                  ? const Color(0xffFB1164)
                  : Colors.transparent,
            ),
          ),
          child: Image.network("http://192.168.197.8:9000${Uri.parse(widget.art.images[index].url).path}" )
      ),
    );
  }
}
