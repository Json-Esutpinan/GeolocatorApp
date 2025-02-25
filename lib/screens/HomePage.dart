import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_bar_app/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  late GoogleMapController mapController;
  LatLng _ubicacionActual = LatLng(0, 0); // Ubicación inicial
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _obtenerUbicacion();
  }

  Future<void> _obtenerUbicacion() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos son denegados, muestra un mensaje.
        print('Permisos de ubicación denegados.');
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Los permisos son denegados para siempre, muestra un mensaje.
      print(
          'Permisos de ubicación denegados permanentemente, no podemos solicitar permisos.');
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _ubicacionActual = LatLng(position.latitude, position.longitude);
        _markers.add(
          Marker(
            markerId: MarkerId("ubicacion_actual"),
            position: _ubicacionActual,
            infoWindow: InfoWindow(title: 'Mi Ubicación'),
          ),
        );
      });
      mapController.animateCamera(CameraUpdate.newLatLng(_ubicacionActual));
    } catch (e) {
      print("Error al obtener la ubicación: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition:
        CameraPosition(target: _ubicacionActual, zoom: 15.0),
        markers: _markers,
      ),
    );
  }
}
