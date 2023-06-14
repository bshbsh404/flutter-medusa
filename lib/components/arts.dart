import 'package:art_store/components/artCard.dart';
import 'package:art_store/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/artController.dart';

class Arts extends StatelessWidget {
  Arts({Key? key}) : super(key: key);

  final artController = Get.put(AllArtsController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child:  Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(children: [
              const SizedBox(height: (20)),
              Obx(() => SizedBox(
                    width: double.infinity,
                    child: artController.isLoading.value
                        ? Center(
                      child: CircularProgressIndicator(color: kPrimary,),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: artController.getAllArts.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              ArtCard(
                                art: artController.getAllArts[index],
                              )),
                    )),
              ),
            ]),
          )),
    );
  }
}