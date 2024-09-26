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

  //4. Llamado de una funcion con varios parametros pocionales.
  //4.1 Enviando ambos parametros
  print(greetHourOfDay("Carlos",9)); 
  // ¿Que pasaria si solo envio un solo parametro?
  print(greetHourOfDay("Carlos",null)); 
  print(greetHourOfDay("Carlos")); 
  print("-----------------------------------------------------");
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
print("-----------------------------------------------------");
  // Las funciones lambda en DART solo pueden llevar una sola instruccion, si llevan mas de una instruccion ya no es lambda
  // 6 Llamado de una funcion con parametros nombre
print(infoCarListStatus(buyerName: "Carlos Martin"));
print("-----------------------------------------------------");
print(infoCarListStatus(
        status: "En espera de pago",
        amountCarList: 653.012,
        buyerName: "Carlos Martin"
));
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
// int? puede ser vacio o sea puede ser null 
// [] puede ser opcional
String greetHourOfDay(String personName, [int? hora])
{
    // El operador ??= signuifica que si es nulo lo inicialuice como, en caso de que tenga valor ignora la instruccion
    hora ??= DateTime.now().hour; 
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
// 6 FUNCIONES CON PARAMETROS 
String infoCarListStatus({
    required String buyerName,
    double amountCarList = 0.0,
    String status = "Seleccion de productos"
}) {
    return "El carrito de compras de: ${buyerName} tiene un total de: \$${amountCarList} y actualmente esta en estatus: ${status}";
}