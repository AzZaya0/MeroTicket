import 'package:flutter/material.dart';
import 'package:template/core/common/controls/custom_image_network.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key, required this.eventImage});
  final String eventImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomImageNetwork(
              imageUrl: eventImage,
              boxFit: BoxFit.cover,
              height: 200,
              width: double.infinity)
        ],
      ),
    );
  }
}
