import 'dart:io';

class Estudiante {
  String nombre;
  String apellido;
  int cedula;
  List<double> notas;
  int asistencias;
  String direccion;
  String telefono;

  double promedio;
  DateTime fechaNac;

  Estudiante(this.cedula, this.nombre, this.apellido, this.fechaNac, this.notas,
      this.direccion, this.telefono) {
    this.asistencias = 0;
    this.promedio = _calcularPromedio();
  }

  int Registrarasistencias(int asistencia) {
    return (this.asistencias += asistencia);
  }

  void Mostrarnotas() {
    print('El nombre del estudiante es: $nombre');
    print('Las notas del estudiante es: $notas');
    print('Las asistencias del estudiante son: $asistencias');
    print('El promedio del estudiante es: ${promedio.toStringAsFixed(2)}');
    print('El estudiante aprobo: ${aprobo() ? "Si" : "No"}');
  }

  bool aprobo() {
    return promedio >= 3.5;
  }

  double _calcularPromedio() {
    double sumaNotas = notas.reduce((a, b) => a + b);
    return sumaNotas / notas.length;
  }

  void cambiarDireccion(String nuevaDireccion) {
    this.direccion = nuevaDireccion;
  }

  void mostrarUsuario() {
    print('Cedula: $cedula');
    print('Nombre: $nombre');
    print('Apellido: $apellido');
    print('Fecha de Nacimiento: $fechaNac');
    print('Direccion: $direccion');
    print('Telefono: $telefono');
  }
}

void main() {
  final estudiante1 = Estudiante(1, 'Luis', 'Garcia', DateTime(1986, 3, 23),
      [3.5, 2.5, 2.0], 'Carrera 80', '80927548');
  final estudiante2 = Estudiante(2, 'Johana', 'Perez', DateTime(1988, 5, 02),
      [5.0, 4.0, 2.1], 'carrera 90', '47893445');
  final estudiante3 = Estudiante(3, 'Jonathan', 'Lopez', DateTime(190, 7, 29),
      [4.0, 4.7, 3.8], 'Carrera 78', '346788993');

  String opcion;
  do {
    print(
        '\n1. Mostrar notas del estudiante\n2. Registrar una nueva asistencia\n3. Salir');
    opcion = stdin.readLineSync()!;
    switch (opcion) {
      case '1':
        print('Notas del primer estudiante:');
        estudiante1.Mostrarnotas();
        print('Notas del segundo estudiante:');
        estudiante2.Mostrarnotas();
        print('Notas del tercer estudiante:');
        estudiante3.Mostrarnotas();
        break;
      case '2':
        print(
            '¿Quieres registrar una nueva asistencia para el  estudiante #2?');
        estudiante1.Registrarasistencias(int.parse(stdin.readLineSync()!));
        print(
            '¿Quieres registrar una nueva asistencia para el  estudiante #2?');
        estudiante2.Registrarasistencias(int.parse(stdin.readLineSync()!));
        print(
            '¿Quieres registrar una nueva asistencia para el  estudiante #3?');
        estudiante3.Registrarasistencias(int.parse(stdin.readLineSync()!));
        break;
      case '3':
        print('Salitr del programa');
        break;
    }
  } while (opcion != '3');

  estudiante1.mostrarUsuario();
}
