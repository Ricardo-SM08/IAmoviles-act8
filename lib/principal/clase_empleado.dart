class Empleado {
  int? id;
  String nombre;
  String rol;
  String email;
  String telefono;
  DateTime fechaIngreso;
  bool activo;

  Empleado({
    this.id,
    required this.nombre,
    required this.rol,
    required this.email,
    required this.telefono,
    required this.fechaIngreso,
    this.activo = true, // Activo por defecto
  });
}
