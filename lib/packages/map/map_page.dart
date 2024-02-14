import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/custom_map.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MapPage extends HookWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 500, child: CustomMap());
  }
}
