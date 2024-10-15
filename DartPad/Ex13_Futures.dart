void main() {
  
  print('Inicio del programa');
  // Peticion al API
  httpGet('https://fernando-herrera.com/cursos')
  // Imprime la solicitud
    .then( 
      (value){
        print( value );
      })
      // En caso de un error
    .catchError( (err) {
    print('Error: $err');
  });
  
  print('Fin del programa');
}

// tarea  que se resuelva a destiempo.
Future<String> httpGet( String url ){
  // Tiempo estimado
  return Future.delayed( const Duration(seconds: 1), () {
    // Devuelve un erro
    throw 'Error en la petición http';
    
//     return 'Respuesta de la petición http';
    
  });
  
}