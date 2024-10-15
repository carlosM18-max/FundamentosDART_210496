void main() {
  // Inicia el stream que emite números y escucha los valores que se emiten
  emitNumbers().listen((value) {
    // Imprimen el valor 
    print('Stream value: $value');
  });
} 

// Función que devuelve un stream de enteros
Stream<int> emitNumbers() {
  // Crea un stream que emite un número cada segundo
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // print('desde periodic $value');
    return value; // Devuelve el número actual 
  }).take(5); // Limite para que emita solo 5 valores
}

// Streams: Es una secuencia representa una secuencia de eventos asincrónicos