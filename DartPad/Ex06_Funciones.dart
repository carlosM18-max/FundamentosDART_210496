void main() {

  final double totalCarList;
  //1. Llamado de una funcion sin parametros
  greetEveryone();
  //2. Llamado de una funcion que retorna valores
  //a) sin almacenar el valor de una variable
  print("Hoy es el dia numero: ${getDayNumber()} del mes");
  //b) almacenando el valor de la funcion en una nueva variable
  final int diaMes;
  diaMes= getDayNumber();
  print("En tres dias sera: ${diaMes+3}");
  //3. Llamado de una funcion con un solo parametro obligatorio
  //a. llamado correcto
  print(greetSomeone("Carlos Martin"));
  //b. En caso de que la funcion este declara como dynamic
  print(greetSomeone(4));
  print(greetSomeone(-312));
  print(greetSomeone(3.1416));
  print(greetSomeone(true));
  print("-----------------------------------------------------");
  //3.1.Mismo experimento pero ahora con la funcion con parametros tipados
 /* print(greetSomeoneTyped("Cristian Ojeda"));
  print(greetSomeoneTyped(4));
  print(greetSomeoneTyped(-312));
  print(greetSomeoneTyped(3.1416));
  print(greetSomeoneTyped(true));*/

  //3.2
  //print(greetSomeone()); //Esta no se puede ejecutar porque si no se define los parametros de una funsion por default estan definidos como obligatorios
  
  //4. Llamado de una funcion con parametros opcionales.
  //4.1 Enviando ambos parametros
  print(greetHourOfDay("Carlos",9));

  // 5.- Funciones lambda - las funciones lambda, mejor conocidas como funciones anonimas o funciones simplificadas, se ejecutan de manera simple y no frecuente en la ejecucuin de un programao sistema
  var calculaCosto = (double productQuantity, double ProductPrice, double percentageDisscount) => (productQuantity * ProductPrice) * ((100 - percentageDisscount)/100);
  double cantidadProduct = 5;
  double precioProduct = 125.50;
  double descuento = 2.5;
  print("""
  Costo del producto: ${precioProduct}
  Cantidad del producto: ${cantidadProduct}
  Descuento del producto: ${descuento}
  -----------------------------------------------------
  Costo del carrito de compras: ${calculaCosto(cantidadProduct,precioProduct,descuento)}
  """);
  // Las funciones lambda en DART solo pueden llevar una sola instruccion, si llevan mas de una instruccion ya no es lambda
}

// funciones y parametros

//declaracion
//1. funcion sin parametros, sin retorno de valor

void greetEveryone()
{
  print("Hola a todos");
}
//2. Funcion sin parametros, que retorna datos

int getDayNumber()
{
    DateTime now = DateTime.now();
    int day = now.day;
    return day;
}

//3. Funcion que recibe un parametro, en Dart si no se especifica como opcional siempre sera obligatorio

String greetSomeone(personName)
{
    return("Hola, ${personName}");
}

//3.1 Tipando el parametro de entrada

String greetSomeoneTyped(String personName)
{
    return("Hola, ${personName}");
}
//4. Funcion con parametros opcionales  Puede ser opcional
String greetHourOfDay(String personName, int? hora)
{
    hora ??= DateTime.now().hour; // Si es nulo entonces....
  print("Hora: ${hora}");
    String saludo;
    
    if(hora>=6 && hora<12)
    {
        saludo = "Buenos dias";
    }
    else if(hora>12 && hora < 18)
    {
        saludo="Buenas tardes";
    }
    else
    {
        saludo="Buenas noches";
    }
    
    return "${saludo}, ${personName}";
    
}
