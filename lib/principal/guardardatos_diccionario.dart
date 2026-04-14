import 'clase_empleado.dart';
import 'diccionario_empleado.dart';

class AgenteGuardarDatos {
  // Patrón Singleton para acceder a la misma instancia desde cualquier pantalla
  static final AgenteGuardarDatos _instancia = AgenteGuardarDatos._interno();
  factory AgenteGuardarDatos() => _instancia;
  AgenteGuardarDatos._interno();

  // Método interno para generar ID autonumérico
  int _generarId() {
    if (datos_empleado.isEmpty) return 1; // Primer registro empieza en 1
    int maxId = datos_empleado.keys.reduce((a, b) => a > b ? a : b);
    return maxId + 1;
  }

  // Agente: Guardar
  void registrarEmpleado(Empleado nuevoEmpleado) {
    int nuevoId = _generarId();
    nuevoEmpleado.id = nuevoId;
    datos_empleado[nuevoId] = nuevoEmpleado; // Se guarda en el diccionario
  }

  // Agente: Leer
  List<Empleado> obtenerEmpleados() {
    return datos_empleado.values.toList();
  }
}
