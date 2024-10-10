void main() {
  // Caso de Prueba 1
  final carlosMArtin = Paciente(
    id: 1,
    name: "Carlos Martin",
    firstLastName: "Hernandez",
    secondLastName: "de Jesus",
    gender: "Masculino",
    bloodGroup: "O+",
    curp: "HEJC031226HPLRSRA1",
    birthDate: DateTime(2003, 12, 26),
    lifeStatus: "Vivo",
    medicalStatus: "Estable",
    nss: "7864531286",
    insuranceType: "IMSS",
    lastAppointmentDate: DateTime.now(),
  );

  print(carlosMArtin);

  // Caso de Prueba 2
  final marthaFlores = Paciente(
    id: 2,
    name: "Martha",
    firstLastName: "Flores",
    gender: "Femenino",
    bloodGroup: "O-",
    curp: "MFL012448644DS",
    birthDate: DateTime(2008, 1, 8),
    lifeStatus: "Vivo",
    medicalStatus: "Ex-trabajadora",
    nss: "7846513268",
    insuranceType: "ISSSTE",
    lastAppointmentDate: DateTime.now(),
    registrationDate: DateTime.now().subtract(Duration(days: 30)),
  );

  print(marthaFlores);

  // Caso de Prueba 3
  final juanTorrez = Paciente(
    id: 3,
    name: "Juan",
    firstLastName: "Torrez",
    secondLastName: "Ramirez",
    gender: "Masculino",
    bloodGroup: "AB+",
    curp: "JRT032A6S79645D",
    birthDate: DateTime(1945, 10, 10),
    lifeStatus: "Vivo", 
    medicalStatus: "Estable",
    nss: "2316879465",
    insuranceType: "Seguro Popular",
    lastAppointmentDate: DateTime.now(),
    registrationDate: DateTime.now().subtract(Duration(days: 90)),
  );

  // Actualizar el estado a inactivo debido al fallecimiento
    juanTorrez.registerDeath(reason: "Infarto", time: DateTime.now());

  print(juanTorrez);
}

// 1.- Definición de la Clase Abstracta <Persona>
abstract class Person {
  int id;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  String bloodGroup;
  String? curp;
  DateTime birthDate;
  bool isActive;
  DateTime registrationDate;
  DateTime? updateDate;

  // 3.- Declaración de las Propiedades de la Clase <Paciente>
  Person({
    required this.id,
    required this.name,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.bloodGroup,
    this.curp,
    required this.birthDate,
    this.isActive = true, 
    DateTime? registrationDate,
    this.updateDate,
  }) : registrationDate = registrationDate ?? DateTime.now();

  // 2.- Definición de la Función de la  Clase
  @override
  String toString() {
    String formatBirthDate = "${birthDate.day.toString().padLeft(2, '0')}/" +
        "${birthDate.month.toString().padLeft(2, '0')}/${birthDate.year}";

    String formatRegistrationDate = "${registrationDate.day.toString().padLeft(2, '0')}/" +
        "${registrationDate.month.toString().padLeft(2, '0')}/${registrationDate.year} " +
        "${registrationDate.hour.toString().padLeft(2, '0')}:" +
        "${registrationDate.minute.toString().padLeft(2, '0')}:" +
        "${registrationDate.second.toString().padLeft(2, '0')}";

    curp ??= "No registrado"; // Si no hay CURP
    // Si esta activo o inactivo
    String statusString = isActive ? "Activo" : "Inactivo";

    return """
      -----------------------------------
      Datos de la persona
      -----------------------------------
      ID: $id,
      Nombre: $name $firstLastName ${secondLastName ?? ""}
      Género: $gender
      Grupo sanguíneo: $bloodGroup
      Fecha de nacimiento: $formatBirthDate
      CURP: $curp
      Estatus: $statusString
      Fecha de registro: $formatRegistrationDate
      -----------------------------------
      """;
  }
}

// Uso de Extends /Implements:
class Paciente extends Person {
  String nss;
  String insuranceType;
  String lifeStatus; // Activo o Finado
  String medicalStatus; // Estado del paciente
  DateTime lastAppointmentDate;

  // Atributos relacionados a defunción
  DateTime? deathTime;
  String? deathReason;

  Paciente({
    required int id,
    required String name,
    required String firstLastName,
    String? secondLastName,
    required String gender,
    required String bloodGroup,
    String? curp,
    required DateTime birthDate,
    bool isActive = true,
    DateTime? registrationDate,
    DateTime? updateDate,
    required this.nss,
    required this.insuranceType,
    required this.lifeStatus,
    required this.medicalStatus,
    required this.lastAppointmentDate,
  }) : super(
          id: id,
          name: name,
          firstLastName: firstLastName,
          secondLastName: secondLastName,
          gender: gender,
          bloodGroup: bloodGroup,
          curp: curp,
          birthDate: birthDate,
          isActive: isActive,
          registrationDate: registrationDate,
          updateDate: updateDate,
        );

  // 7.- Sobreescritura de la Función registrarDefuncion()
  void registerDeath({required String reason, required DateTime time}) {
    if (lifeStatus.toLowerCase() == 'Finado') {
      print("Error: El paciente ya está registrado como Finado.");
      return;
    }

    // Actualización del estado
    lifeStatus = 'Finado';
    isActive = false; // Cambia el estado a inactivo
    deathTime = time;
    deathReason = reason;
    updateDate = DateTime.now(); // Registra la nueva fecha
  }

  // Sobreescritura del método toString() para incluir los detalles del paciente
  @override
  String toString() {
    String result = super.toString() +
        """
      NSS: $nss
      Tipo de seguro: $insuranceType
      Estatus de vida: $lifeStatus
      Estado médico: $medicalStatus
      Fecha de la última cita: ${lastAppointmentDate.day}/${lastAppointmentDate.month}/${lastAppointmentDate.year}
      """;

    // Detalles de la defunción
    if (lifeStatus == 'Finado') {
      result += """
      Motivo de defunción: ${deathReason ?? "No especificado"}
      Hora de defunción: ${deathTime != null ? "${deathTime!.hour}:${deathTime!.minute}" : "No especificada"}
      """;
    }

    result += "-----------------------------------\n";
    return result;
  }
}
