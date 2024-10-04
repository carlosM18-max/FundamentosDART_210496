void main ()
{
//Constructores Nombrados
  //Caso de prueba 1
  final carlosMartin = Person(

      ID:254,
      name:"Carlos Martin",
      firstLastName:"Hernandez",
      secondLastName:"de Jesus",
      gender:"Hombre",
      bloodGroup: "O+",
      curp: "",
      birthdate: DateTime(2003,12,26),
      isActive: true,
      createdAt: DateTime(2024,09,2024,11,05,16),

  );

  print(carlosMartin);

  //Caso 2 -- enviando solo los datos requeridos obligatoriamente

  final marthaFlores = Person(

      ID:125,
      name:"Martha",
      firstLastName:"Flores",
      gender:"Mujer",
      bloodGroup: "O+",
      birthdate: DateTime(2008,01,08),
      createdAt: DateTime(2024,09,2024,11,05,16),

  );
  print(marthaFlores);

}

class Person
  {
  int ID;
  String? cortesyTitle;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  String bloodGroup;
  String? curp;
  DateTime birthdate;
  bool isActive;
  DateTime createdAt;
  DateTime? updateAt;


  Person(
    {
    required this.ID,
    required this.name,
    this.cortesyTitle,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.bloodGroup,
    this.curp,
    required this.birthdate,
    this.isActive=true,
    DateTime? createdAt,
    this.updateAt
  }

  ):createdAt=createdAt??DateTime.now();

  @override
  String toString()
  {
    String formateBirthDate = "${birthdate.day.toString().padLeft(2,'0')}/"+
      "${birthdate.month.toString().padLeft(2,'0')}/${birthdate.year}";
    String formateCreateDate =                
      "${createdAt.day.toString().padLeft(2,'0')}/"+
      "${createdAt.month.toString().padLeft(2,'0')}/${createdAt.year}     ${createdAt.hour.toString().padLeft(2,'0')} : ${createdAt.minute.toString().padLeft(2,'0')} : ${createdAt.second.toString().padLeft(2,'0')}";

    curp ??="No registrado";
    if(curp == "")curp = "No registrado";

    String status = "Sin definir";
    if (isActive)
      status = "Activo";
    else
      status = "Inactivo";

    return """
      -----------------------------------
      DATOS DE LA PERSONA
      -----------------------------------
      ID: $ID,
      Nombre: $name $firstLastName $secondLastName
      Genero: $gender
      Grupo Sanguineo: $bloodGroup
      Fecha de nacimiento: $formateBirthDate
      CURP: $curp
      Activo: $status
      Fecha de registro:  $formateCreateDate
      ------------------------------------
      """;
  }
  }