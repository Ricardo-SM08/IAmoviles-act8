import 'package:flutter/material.dart';
import 'principal/inicio.dart';
import 'principal/captura_empleados.dart';
import 'principal/ver_empleados.dart';

void main() => runApp(const EmpleadosApp());

class EmpleadosApp extends StatelessWidget {
  const EmpleadosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Directorio de Empleados',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(
          0xFFF8F5FB,
        ), // Blanco con ligero toque lila
        primaryColor: const Color(0xFF673AB7), // Deep Purple
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF673AB7),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/captura_empleados': (context) => const CapturaEmpleados(),
        '/ver_empleados': (context) => const VerEmpleados(),
      },
    );
  }
}
