import 'package:flutter/material.dart';
import 'package:movies/core/resources/images_manager.dart';

class Nosearch extends StatelessWidget {
  const Nosearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImagesManager.notFound));
  }
}
