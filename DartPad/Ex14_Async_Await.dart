void main() async {
  print('Inicio del programa');
  
  try {
    // Llama a la función httpGet y espera su resultado
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // imprime el valor
    print(value);
    
  } catch (err) {
    // captura y muestra el error
    print('Tenemos un error: $err');
  }
  
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // Simula una espera de 1 segundo
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanza un error en la petición 
  throw 'Error en la petición';
  
  // return 'Tenemos un valor de la petición';
}
