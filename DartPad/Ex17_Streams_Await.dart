void main() {
  // Inicia el stream que emite números y escucha los valores que se emiten
  emitNumber()
     .listen( (int value) {
        // Imprime el valor
       print( 'Stream value: $value' );
       
     }); 
}

// Función que devuelve un stream de enteros usando async*
Stream<int> emitNumber() async* {
  // Arreglo de valores 
  final valuesToEmit = [1, 2, 3, 4, 5];
  
  // Itera sobre cada número en la lista
  for (int i in valuesToEmit) {
    // Espera 1 segundo antes de emitir el número siguiente
    await Future.delayed(const Duration(seconds: 1));
    // Emite el número actual
    yield i;
  }
}