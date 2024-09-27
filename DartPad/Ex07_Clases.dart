void main(){
  // Repaso de clases en DART
  // Instanciamos la clasde Hero
  final wolverine = Hero("Logan", "Regeneracion");
    
  print("-----------------------------------------------------");
  print("Hero");
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
  print("-----------------------------------------------------");
  final magneto = Hero("Erick", "Campos Magneticos");
  print("Anti-Heroe");
  print(magneto);
  print(magneto.name);
  print(magneto.power);
  print("-----------------------------------------------------");
  final xmen = Team(type:"Heroes", name:"X-Men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);
  print("-----------------------------------------------------");
  final JL = Team(name:"La Liga de la Justicia");
  print(JL);
  print(JL.name);
  print(JL.type);
  print("-----------------------------------------------------");
  /*Intenteamos instaciar la clase con solo el valor tio, que np lo permite la propiedad de nombre requerida*/
  // final hydra = Team(type: "Villans");
}

// Clases con propiedadeds posicionales
class Hero{
  String name;
  String power;
// Como se inicializa
  Hero(String pName, String pPower):
    name = pName,
    power = pPower;

}

// Clase con propiedades no pisicionales y nombradas
class Team{
    String name;
    String type;
    // El constructor de la clase siempre debe llevar el mismo nombre de la misma
    Team({required this.name, this.type="No definido"});
  
  @override
  String toString(){
    return 'Grupo: $name, Tipo: $type';
  }
}