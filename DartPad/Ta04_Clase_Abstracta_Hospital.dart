void main() {
  // 8. Caso de Prueba 1: Nuevo paciente registrado hoy
  final pacienteManager = AdministradorPacientes();

  final carlosMartin = Paciente(
    id: 1,
    firstName: "Carlos Martin",
    lastName: "Hernandez",
    lastSecondName: "de Jesus",
    gender: Gender.Masculino,
    bloodType: BloodType.OP,
    curp: "HEJC031226HPÑRSRA1",
    birthDate: DateTime(2003, 12, 26),
    lifeStatus: LifeStatus.Vivo,
    medicalCondition: "Estable",
    nss: "789645gf64d98",
    insuranceType: InsuranceType.IMSS,
    lastDate: DateTime.now(),
    registrationDate: DateTime.now(),
  );

  pacienteManager.registrarPaciente(carlosMartin);

  // 9. Caso de Prueba 2: Paciente que alguna vez fue trabajador del hospital
  final juanPerez = Paciente(
    id: 2,
    firstName: "Juan",
    lastName: "Perez",
    gender: Gender.Masculino,
    bloodType: BloodType.OP,
    curp: "JPCD0325ASFSFFDGS",
    birthDate: DateTime(2004, 08, 15),
    lifeStatus: LifeStatus.Vivo,
    medicalCondition: "En Observación",
    nss: "13gds84gd68s4g8",
    insuranceType: InsuranceType.IMSS,
    lastDate: DateTime.now(),
    registrationDate: DateTime.now().subtract(Duration(days: 60)),
  );

  pacienteManager.registrarPaciente(juanPerez);

  // 10. Caso de Prueba 3: Paciente que acaba de fallecer
  final fernandaTorrez = Paciente(
    id: 3,
    firstName: "Fernanda",
    lastName: "Torrez",
    lastSecondName: "Aguilar",
    gender: Gender.Femenino,
    bloodType: BloodType.BN,
    curp: "TRAF451010MDFRGD05",
    birthDate: DateTime(1945, 10, 10),
    lifeStatus: LifeStatus.Vivo,
    medicalCondition: "Crítico",
    nss: "515f34ds8f65gd",
    insuranceType: InsuranceType.SeguroPopular,
    lastDate: DateTime.now(),
    registrationDate: DateTime.now().subtract(Duration(days: 90)),
  );

  // Actualizar estatus a fallecido
  fernandaTorrez.registrarDefuncion(
    causa: "Paro Cardiaco",
    horaDefuncion: DateTime.now(),
  );

  pacienteManager.registrarPaciente(fernandaTorrez);

  // Mostrar pacientes
  pacienteManager.mostrarPacientes();

  // Actualizar paciente
  carlosMartin.medicalCondition = "En Recuperación";
  pacienteManager.modificarPaciente(carlosMartin);

  // Mostrar pacientes después de la actualización
  pacienteManager.mostrarPacientes();

  // Eliminar paciente
  pacienteManager.eliminarPaciente(carlosMartin.id);

  // Mostrar pacientes después de la eliminación
  pacienteManager.mostrarPacientes();
}

// estatus de vida
enum LifeStatus {
  Vivo,
  Finado
}

// tipo de seguro
enum InsuranceType {
  IMSS,
  ISSSTE,
  SeguroPopular
}

// grupo sanguíneo
enum BloodType {
  OP,
  ON,
  AP,
  AN,
  BP,
  BN,
  ABP,
  ABN
}

// Enum para el género
enum Gender { Masculino, Femenino }

// 1.- Definición de la clase Abstracta
abstract class Persona {
  int id;
  String firstName;
  String lastName;
  String? lastSecondName;
  Gender gender;
  BloodType bloodType;
  String? curp;
  DateTime birthDate;
  bool isActive;
  DateTime registrationDate;
  DateTime? lastUpdate;

  // 2.- Definición de la Función de la Clase
  Persona({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.lastSecondName,
    required this.gender,
    required this.bloodType,
    this.curp,
    required this.birthDate,
    this.isActive = true,
    DateTime? registrationDate,
    this.lastUpdate,
  }) : registrationDate = registrationDate ?? DateTime.now();

  // Método modificado
  String detallesPersona() {
    String formattedBirthDate = "${birthDate.day.toString().padLeft(2, '0')}/" +
        "${birthDate.month.toString().padLeft(2, '0')}/${birthDate.year}";

    String formattedRegistrationDate = "${registrationDate.day.toString().padLeft(2, '0')}/" +
        "${registrationDate.month.toString().padLeft(2, '0')}/${registrationDate.year} " +
        "${registrationDate.hour.toString().padLeft(2, '0')}:" +
        "${registrationDate.minute.toString().padLeft(2, '0')}:" +
        "${registrationDate.second.toString().padLeft(2, '0')}";

    curp ??= "No Registrado";
    if (curp == "") curp = "No Registrado";

    String status = isActive ? "Activo" : "Inactivo";

    return """
      Detalles de la Persona
      ---------------------------------
      ID: $id,
      Nombre: $firstName $lastName ${lastSecondName ?? ""}
      Género: ${gender.name}
      Tipo de Sangre: ${bloodType.name}
      Fecha de Nacimiento: $formattedBirthDate
      Curp: $curp
      Estatus: $status
      Fecha Registro:  $formattedRegistrationDate
      ---------------------------------
      """;
  }
}

// Establecer un contrato que cualquier clase que desee registrar defunciones debe seguir
abstract class RegistroDefuncion {
  void registrarDefuncion({required String causa, required DateTime horaDefuncion});
}

// 3.- Declaración de las Propiedades de la Clase <Paciente>
// 7.- Uso de Extends / Implements
class Paciente extends Persona implements RegistroDefuncion {
  String nss;
  InsuranceType insuranceType;
  LifeStatus lifeStatus;
  String medicalCondition;
  DateTime lastDate;
  DateTime? dischargeDate;
  DateTime? timeOfDeath;
  String? causeOfDeath;

  // 4.- Sobreescritura de las Propiedades de la clase Abstracta <Persona>
  Paciente({
    required int id,
    required String firstName,
    required String lastName,
    String? lastSecondName,
    required Gender gender,
    required BloodType bloodType,
    String? curp,
    required DateTime birthDate,
    bool isActive = true,
    DateTime? registrationDate,
    DateTime? lastUpdate,
    required this.nss,
    required this.insuranceType,
    required this.lifeStatus,
    required this.medicalCondition,
    required this.lastDate,
    this.dischargeDate,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            lastSecondName: lastSecondName,
            gender: gender,
            bloodType: bloodType,
            curp: curp,
            birthDate: birthDate,
            isActive: isActive,
            registrationDate: registrationDate,
            lastUpdate: lastUpdate,
          );

  // 6.- Sobreescritura de la Función registrar Defunción()
  @override
  void registrarDefuncion({required String causa, required DateTime horaDefuncion}) {
    lifeStatus = LifeStatus.Finado;
    isActive = false;
    this.timeOfDeath = horaDefuncion;
    causeOfDeath = causa;
    lastUpdate = DateTime.now();
  }

  @override
  String toString() {
    String result = detallesPersona() +
        """
  NSS: $nss
  Tipo de Seguro: ${insuranceType.name} 
  Estatus de Vida: ${lifeStatus.name} 
  Estado Médico: $medicalCondition
        """;

    if (dischargeDate != null) {
      result += "Fecha de Alta: ${dischargeDate!.day.toString().padLeft(2, '0')}/" +
          "${dischargeDate!.month.toString().padLeft(2, '0')}/${dischargeDate!.year} " +
          "${dischargeDate!.hour.toString().padLeft(2, '0')}:" +
          "${dischargeDate!.minute.toString().padLeft(2, '0')}:${dischargeDate!.second.toString().padLeft(2, '0')}\n";
    }

    result += "Fecha de la Última Cita: ${lastDate.day.toString().padLeft(2, '0')}/" +
        "${lastDate.month.toString().padLeft(2, '0')}/${lastDate.year} " +
        "${lastDate.hour.toString().padLeft(2, '0')}:" +
        "${lastDate.minute.toString().padLeft(2, '0')}:${lastDate.second.toString().padLeft(2, '0')}\n";

    if (lifeStatus == LifeStatus.Finado) {
      String formattedLastUpdate = "${lastUpdate!.day.toString().padLeft(2, '0')}/" +
          "${lastUpdate!.month.toString().padLeft(2, '0')}/${lastUpdate!.year} " +
          "${lastUpdate!.hour.toString().padLeft(2, '0')}:" +
          "${lastUpdate!.minute.toString().padLeft(2, '0')}:" +
          "${lastUpdate!.second.toString().padLeft(2, '0')}";

      result += "Fecha de Defunción: ${timeOfDeath!.day.toString().padLeft(2, '0')}/" +
          "${timeOfDeath!.month.toString().padLeft(2, '0')}/${timeOfDeath!.year} " +
          "${timeOfDeath!.hour.toString().padLeft(2, '0')}:" +
          "${timeOfDeath!.minute.toString().padLeft(2, '0')}:" +
          "${timeOfDeath!.second.toString().padLeft(2, '0')}\n" +
          "Causa de la Defunción: $causeOfDeath\n" +
          "Última Actualización: $formattedLastUpdate\n";
    }

    return result;
  }
}

// 5.- Métodos CRUD de la Clase
class AdministradorPacientes {
  final List<Paciente> _pacientes = [];

  void registrarPaciente(Paciente paciente) {
    _pacientes.add(paciente);
    print("Paciente registrado: ${paciente.firstName} ${paciente.lastName}");
  }

  void modificarPaciente(Paciente pacienteModificado) {
    final index = _pacientes.indexWhere((p) => p.id == pacienteModificado.id);
    if (index != -1) {
      _pacientes[index] = pacienteModificado;
      print("Paciente modificado: ${pacienteModificado.firstName} ${pacienteModificado.lastName}");
    } else {
      print("Paciente no encontrado.");
    }
  }

  void eliminarPaciente(int id) {
    _pacientes.removeWhere((paciente) => paciente.id == id);
    print("Paciente eliminado con ID: $id");
  }

  void mostrarPacientes() {
    if (_pacientes.isEmpty) {
      print("No hay pacientes registrados.");
    } else {
      print("Pacientes registrados:");
      for (var paciente in _pacientes) {
        print(paciente);
      }
    }
  }
}
