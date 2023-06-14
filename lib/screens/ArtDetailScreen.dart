import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../components/artCardDetail.dart';
import '../models/artModel.dart' as model;
import '../utils/utilities.dart';

class ArtDetails extends StatefulWidget {
  const ArtDetails({Key? key, required this.art}) : super(key: key);

  final model.Arts art;

  @override
  State<ArtDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ArtDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimary,
          leading: IconButton(icon: Icon(FeatherIcons.arrowLeft, color: kWhite,), onPressed: () { Navigator.pop(context); },),
          title: Text(widget.art.title, style: TextStyle(color: kWhite),),
        ),
        body: ArtCardDetails(art: widget.art)
    );
  }
}