import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/feature/onboard/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({Key? key, required this.model}) : super(key: key);
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(model.title, style: Theme.of(context).textTheme.headline5),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}
