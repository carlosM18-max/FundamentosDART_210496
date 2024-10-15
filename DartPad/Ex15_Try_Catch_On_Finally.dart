void main() async {
  print('Inicio del programa');
  
  try {
    // Llama a la función httpGet y espera su resultado
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // imprime el valor
    print('éxito: $value');
    
  } on Exception catch(err) {
    // Captura errores de tipo exception
    print('Tenemos una Exception: $err');
    
  } catch (err) {
    // Captura cualquier otro tipo de error
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    // Se ejecuta siempre, independientemente de si hubo un error
    print('Fin del try y catch');
  }
  
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // Una espera de 1 segundo
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanza una excepción personalizada
  throw Exception('No hay parámetros en el URL');
  
  // throw 'Error en la petición';
  // return 'Tenemos un valor de la petición';
}
