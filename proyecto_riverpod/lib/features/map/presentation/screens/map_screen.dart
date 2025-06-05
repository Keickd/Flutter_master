import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/widgets/end_drawer.dart';
import 'package:proyecto_riverpod/features/map/presentation/providers/map_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  void initState() {
    super.initState();
    /* Future.microtask(() {
      ref.read(mapNotifierProvider.notifier).getBizis();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    /* final mapState = ref.watch(mapNotifierProvider);

    final features = mapState.biziModel.features;

    if (features.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final coordinates = features.first.geometry.coordinates;
    final targetX = coordinates.first;
    final targetY = coordinates.last;*/

    final targetX = 40.45;
    final targetY = 40.45;

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa simple')),
      endDrawer: const EndDrawer(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(targetX, targetY),
          zoom: 12,
        ),
      ),
    );
  }
}
