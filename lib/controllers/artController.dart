import 'package:get/get.dart';
import '../api/art.dart';
import '../models/artModel.dart';

class AllArtsController extends GetxController {
  var getAllArts = <Arts>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllArt();
  }

  void fetchAllArt() async {
    isLoading(true);
    try {
      var getAllArtResult = await ArtApi().getAllArts();
      getAllArts.value = getAllArtResult;
    } finally {
      isLoading(false);
    }
  }
}