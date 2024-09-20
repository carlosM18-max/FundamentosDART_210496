void main() {
  // Listas (LIST)
  
  // La declaracion de una LIST esta limitada por corchetes (BRACKETS), y cada elemeto
  // puede ser individual y puede repetirse
  final numeros = [1,2,2,2,3,4,5,6,7,7,7,7,8,8,9,10];
  
  print("Ejemplos de LIST: $numeros");
  print("Confirmamos el tipo de dato para NUMEROS que es: ${numeros.runtimeType}");
  print("Podemos acceser a cierta informacion de una lista, tal como: ");
  print("Tamaño: ${numeros.length}");
  print("""
  Para acceder a los elementos debemos especificar la posicion entre []
  El primer elemento en la primero posicion es: ${numeros[0]}
  El elemento en la segunda posicion es: ${numeros[1]}, siempre representando la posicion -1
  El ultimo elemento de la lista seria: ${numeros[numeros.length-1]}
  --------------------------------------------------------------------------------------------
  De igual manera existen las siguientes alternativas
  primer elemento ${numeros.first}
  Ultimo elementos ${numeros.last}
  --------------------------------------------------------------------------------------------
  Tambien tendremos accesso a algunos metodos que permiten la transformacion del contenido, por
  ejemplos, usar reversed para invertir el orden original: ${numeros.reversed}
  Es importante observar que la funcion reversed ha transformado la LIST original y la retorna como un ITERABLE
  """);
  
  // Iterables (Iterables)
  final numeroAlreves = numeros.reversed;
  print("Los iterables son estructuras de datos que DART y otros lenguajes para optimizar en terminos de velocidad al acceso a los datos y propiedades");
  print("Ejemplo de un ITERAVLES: $numeroAlreves");
  print("Confirmamos el tipo de datos para NUMEROALREVES que es: ${numeroAlreves.runtimeType}");
  print("De igual manera podemos transformar una LISTA en un ITERABLE y viceversa");
  print("Convertimos el ITERABLE a LIST usando .toList(): ${numeroAlreves.toList()} y verificamos su tipo de dato: ${numeroAlreves.toList().runtimeType}");
  
  // Conjunto de datos (SET)
  //Un SET es una estructura de datos utilizada por DART, que simplifica los elementos eliminando los duplicados
  print(""""
  Veamos que pasa con los conjuntos (SET)
  Convertimos el ITERABLE en un SET usando .toSet(); ${numeroAlreves.toSet()}
  Podemos visualizar en el resultado que el SET a eliminado los dulicados y ahora delimita los datos usando {}
  """);

  // De igual manera podemos realizar operaciones oara ekl filtro de elementos usando .where()
  final numerosMayoresA5 = numeros.where((int num) {
    return num>5;
  });

  print("""
  Hemos filtrado sobre la LIST solo los elementos mayores a 5, resultado del filtro: ${numerosMayoresA5}
  """);

  print("""
  Eliminamos duplicados, resultado del filtro: ${numerosMayoresA5.toSet()}
  """);

}