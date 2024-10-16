import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatelessWidget {
  const MyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación Específica'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: const LatLng(-17.998787, -70.240767), // Ubicación central
          zoom: 19.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(-17.998787, -70.240767),
                width: 30,
                height: 30,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
