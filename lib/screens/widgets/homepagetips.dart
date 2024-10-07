import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:flutter/material.dart';

class HomePageTipsWidget extends StatelessWidget {
  const HomePageTipsWidget({
    super.key, required this.image, required this.text,
  });
 final Image image;
 final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      //  constraints: BoxConstraints(minWidth: 5, maxWidth: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(2)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
           image,  Text(text)],
        ),
      ),
    );
  }
}
