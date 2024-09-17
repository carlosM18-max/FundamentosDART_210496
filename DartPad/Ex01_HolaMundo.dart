void main (){
  //Declarando una variable geenrica para alamcenar mi nombre
  
  var myName = 'Carlos';
  String myLastName = 'Hernandez de Jesus';
  final int myDNI = 210496;
  late final int myAge;
  
  // Corregir nombre
  myName = "Carlos Martin";
  // Esto ocaciona un error porque la variable esta definida como final y no puede alterarse
  // myDNI = 210486;
  
  print('Hola, $myName $myLastName, tu matricula es: $myDNI y tun edad aun lo la conozco, porque no se cuando naciste');
  
  // Interpretacion de valores
  print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aun no la conozco, porque no se cuando naciste');
}