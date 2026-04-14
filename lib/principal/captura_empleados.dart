import 'package:flutter/material.dart';
import 'clase_empleado.dart';
import 'guardardatos_diccionario.dart';

class CapturaEmpleados extends StatefulWidget {
  const CapturaEmpleados({super.key});

  @override
  State<CapturaEmpleados> createState() => _CapturaEmpleadosState();
}

class _CapturaEmpleadosState extends State<CapturaEmpleados> {
  final _formKey = GlobalKey<FormState>();
  final AgenteGuardarDatos _agente = AgenteGuardarDatos();

  // Controladores de los campos
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _telefonoCtrl = TextEditingController();

  String _rolSeleccionado = "Mecánico Senior";
  bool _estaActivo = true;

  final List<String> _roles = [
    "Mecánico Senior",
    "Vendedor",
    "Admin",
    "Soporte",
  ];

  void _guardarDatos() {
    if (_formKey.currentState!.validate()) {
      Empleado nuevoEmpleado = Empleado(
        nombre: _nombreCtrl.text,
        rol: _rolSeleccionado,
        email: _emailCtrl.text,
        telefono: _telefonoCtrl.text,
        fechaIngreso: DateTime.now(), // Asigna la fecha actual automáticamente
        activo: _estaActivo,
      );

      _agente.registrarEmpleado(nuevoEmpleado);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Empleado registrado exitosamente"),
          backgroundColor: Color(0xFF00BFA5), // Teal armónico
        ),
      );

      // Limpiar formulario después de guardar
      _nombreCtrl.clear();
      _emailCtrl.clear();
      _telefonoCtrl.clear();
      setState(() => _rolSeleccionado = _roles.first);
    }
  }

  Widget _crearInput(
    String label,
    TextEditingController controller,
    IconData icono,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icono, color: const Color(0xFF673AB7)),
          filled: true,
          fillColor: const Color(0xFFEDE7F6), // Lila muy claro
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Empleado')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _crearInput('Nombre Completo', _nombreCtrl, Icons.person),
              _crearInput('Correo Electrónico', _emailCtrl, Icons.email),
              _crearInput('Teléfono', _telefonoCtrl, Icons.phone),

              // Dropdown para Rol
              DropdownButtonFormField<String>(
                value: _rolSeleccionado,
                decoration: InputDecoration(
                  labelText: 'Puesto',
                  prefixIcon: const Icon(Icons.work, color: Color(0xFF673AB7)),
                  filled: true,
                  fillColor: const Color(0xFFEDE7F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: _roles
                    .map(
                      (rol) => DropdownMenuItem(value: rol, child: Text(rol)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _rolSeleccionado = value!),
              ),
              const SizedBox(height: 20),

              // Switch Activo/Inactivo
              SwitchListTile(
                title: const Text(
                  "Estado del Empleado",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _estaActivo ? "Activo en el sistema" : "Dado de baja",
                ),
                value: _estaActivo,
                activeColor: const Color(0xFF00BFA5),
                onChanged: (bool valor) => setState(() => _estaActivo = valor),
              ),
              const SizedBox(height: 30),

              // Botón Guardar
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF673AB7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: _guardarDatos,
                  child: const Text(
                    "Guardar Datos",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
