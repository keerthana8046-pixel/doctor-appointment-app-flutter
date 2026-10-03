class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String experience;
  final String phone;
  final String email;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.experience,
    required this.phone,
    required this.email,
  });
}

class Appointment {
  final String id;
  final String patientName;
  final String doctorName;
  final String specialization;
  final String date;
  final String time;
  String status;

  Appointment({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
    required this.status,
  });
}

class MedicalRecord {
  final String patientName;
  final String doctorName;
  final String diagnosis;
  final String date;
  final String prescription;

  MedicalRecord({
    required this.patientName,
    required this.doctorName,
    required this.diagnosis,
    required this.date,
    required this.prescription,
  });
}
