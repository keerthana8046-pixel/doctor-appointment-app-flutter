import 'package:flutter/material.dart';
import 'package:keerthana/appdata.dart';

class DoctorPatients extends StatelessWidget {
  const DoctorPatients({super.key});

  @override
  Widget build(BuildContext context) {
    final patients = AppData.appointments
        .where((appointment) => appointment.doctorName == AppData.currentDoctor)
        .map((appointment) => appointment.patientName)
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Patients')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF4F9FF), Color(0xFFE8F3FF)],
          ),
        ),
        child: patients.isEmpty
            ? Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Text(
                    'No patients found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB8D9FF)
                              .withValues(alpha: 0.24),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF4FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Color(0xFF0E5D9A),
                          size: 28,
                        ),
                      ),
                      title: Text(
                        patients[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      subtitle: const Text(
                        'Patient',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF1E88E5),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
