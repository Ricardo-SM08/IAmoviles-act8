import 'package:flutter/material.dart';
import 'clase_empleado.dart';
import 'guardardatos_diccionario.dart';

class VerEmpleados extends StatefulWidget {
  const VerEmpleados({super.key});

  @override
  State<VerEmpleados> createState() => _VerEmpleadosState();
}

class _VerEmpleadosState extends State<VerEmpleados> {
  final AgenteGuardarDatos _agente = AgenteGuardarDatos();
  List<Empleado> _listaEmpleados = [];

  @override
  void initState() {
    super.initState();
    _listaEmpleados = _agente.obtenerEmpleados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Directorio')),
      body: _listaEmpleados.isEmpty
          ? const Center(
              child: Text(
                "No hay empleados registrados",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _listaEmpleados.length,
              itemBuilder: (context, index) {
                Empleado emp = _listaEmpleados[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFEDE7F6),
                      radius: 25,
                      child: Text(
                        emp.id.toString(),
                        style: const TextStyle(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      emp.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          emp.rol,
                          style: TextStyle(color: Colors.purple.shade700),
                        ),
                        Text(emp.email),
                        Text(
                          "Fecha Ingreso: ${emp.fechaIngreso.day}/${emp.fechaIngreso.month}/${emp.fechaIngreso.year}",
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.circle,
                      size: 15,
                      color: emp.activo
                          ? const Color(0xFF00BFA5)
                          : Colors.red, // Verde si activo, Rojo si inactivo
                    ),
                  ),
                );
              },
            ),
    );
  }
}
