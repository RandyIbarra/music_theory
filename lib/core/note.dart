import 'dart:math';

class Nota {
  final String nombre;
  // Distancia en semitonos desde A (La)
  final int semitonosDesdeLa;

  const Nota(this.nombre, this.semitonosDesdeLa);

  // Instancias estáticas
  static const Nota A = Nota('A', 0);
  static const Nota ASharp = Nota('A#', 1);
  static const Nota B = Nota('B', 2);
  static const Nota C = Nota('C', -9);
  static const Nota CSharp = Nota('C#', -8);
  static const Nota D = Nota('D', -7);
  static const Nota DSharp = Nota('D#', -6);
  static const Nota E = Nota('E', -5);
  static const Nota F = Nota('F', -4);
  static const Nota FSharp = Nota('F#', -3);
  static const Nota G = Nota('G', -2);
  static const Nota GSharp = Nota('G#', -1);

  static const List<Nota> todas = [
    A,
    ASharp,
    B,
    C,
    CSharp,
    D,
    DSharp,
    E,
    F,
    FSharp,
    G,
    GSharp
  ];

  double get frecuencia => 440.0 * pow(2, semitonosDesdeLa / 12);

  /// Calcula la frecuencia de la nota en una octava específica
  double getFrecuenciaEnOctava(int octava) {
    int diferenciaOctavas = octava - 4;
    return frecuencia * pow(2, diferenciaOctavas);
  }

  @override
  String toString() => '$nombre (${frecuencia.toStringAsFixed(2)} Hz)';
}
