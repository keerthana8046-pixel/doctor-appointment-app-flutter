import 'package:keerthana/models.dart';

class AppData {
  static String currentPatient = "Keerthana";
  static String currentDoctor = "Dr. Ravi Kumar";

  static List<Doctor> doctors = [
    Doctor(
      id: "D001",
      name: "Dr. Ravi Kumar",
      specialization: "Cardiologist",
      qualification: "MBBS, MD",
      experience: "12 Years",
      phone: "9876543210",
      email: "ravi@hospital.com",
    ),
    Doctor(
      id: "D002",
      name: "Dr. Priya Sharma",
      specialization: "Dermatologist",
      qualification: "MBBS, MD",
      experience: "8 Years",
      phone: "9876501234",
      email: "priya@hospital.com",
    ),
    Doctor(
      id: "D003",
      name: "Dr. Arun Kumar",
      specialization: "Neurologist",
      qualification: "MBBS, DM",
      experience: "15 Years",
      phone: "9988776655",
      email: "arun@hospital.com",
    ),
  ];

  static List<Appointment> appointments = [
    Appointment(
      id: "A001",
      patientName: "Keerthana",
      doctorName: "Dr. Ravi Kumar",
      specialization: "Cardiologist",
      date: "25/09/2026",
      time: "10:30 AM",
      status: "Confirmed",
    ),
  ];

  static List<MedicalRecord> records = [
    MedicalRecord(
      patientName: "Keerthana",
      doctorName: "Dr. Ravi Kumar",
      diagnosis: "General Checkup",
      date: "20/09/2026",
      prescription: "Paracetamol - 1 tablet after food",
    ),
  ];
}
