import 'package:flutter/material.dart';
import 'package:keerthana/doctorappointment.dart';
import 'package:keerthana/doctorpatients.dart';
import 'package:keerthana/loginscreen.dart';
import 'package:keerthana/medicalrecords.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),

            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Welcome, Doctor!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [
                  dashboardCard(
                    context,
                    Icons.calendar_month,
                    "Appointments",
                    const DoctorAppointments(),
                  ),

                  dashboardCard(
                    context,
                    Icons.people,
                    "Patients",
                    const DoctorPatients(),
                  ),

                  dashboardCard(
                    context,
                    Icons.medical_information,
                    "Medical Records",
                    const MedicalRecords(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return Card(
      elevation: 4,

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 50, color: Colors.blue),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
