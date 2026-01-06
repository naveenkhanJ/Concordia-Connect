import 'package:flutter/material.dart';

class ReactionSection extends StatefulWidget {
  const ReactionSection({super.key});

  @override
  State<ReactionSection> createState() => _ReactionSectionState();
}

class _ReactionSectionState extends State<ReactionSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 12),
            Icon(Icons.thumb_up_alt),
            SizedBox(width: 5),
            Text("100"),
            SizedBox(width: 18),
            Icon(Icons.comment),
            SizedBox(width: 5),

            Text("10"),
            SizedBox(width: 18),
            Icon(Icons.share),
          ],
        ),
        Row(
          children: [
            Icon(Icons.monitor_heart_rounded),
            SizedBox(width: 10),
            Icon(Icons.social_distance_sharp),
          ],
        ),
      ],
    );
  }
}
