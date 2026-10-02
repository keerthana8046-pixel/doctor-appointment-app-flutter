import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPatient = true;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? selectedSpecialization;

  final List<String> specializations = [
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Pediatrician",
    "Orthopedic",
    "General Physician",
  ];

  void signup() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!isPatient && selectedSpecialization == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select specialization")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isPatient
              ? "Patient account created successfully!"
              : "Doctor account created successfully!",
        ),
      ),
    );

    // After successful signup
    // you can navigate to LoginScreen here.
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Center(
                child: Icon(Icons.local_hospital, size: 70, color: Colors.blue),
              ),

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Hospital Management System",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Register As",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text("Patient"),
                      selected: isPatient,
                      onSelected: (value) {
                        setState(() {
                          isPatient = true;
                          selectedSpecialization = null;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ChoiceChip(
                      label: const Text("Doctor"),
                      selected: !isPatient,
                      onSelected: (value) {
                        setState(() {
                          isPatient = false;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Full Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your name";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter email";
                  }

                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Phone
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter phone number";
                  }

                  if (value.length != 10) {
                    return "Phone number must contain 10 digits";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Doctor specialization
              if (!isPatient) ...[
                DropdownButtonFormField<String>(
                  initialValue: selectedSpecialization,

                  decoration: const InputDecoration(
                    labelText: "Specialization",
                    prefixIcon: Icon(Icons.medical_services),
                    border: OutlineInputBorder(),
                  ),

                  items: specializations.map((specialization) {
                    return DropdownMenuItem(
                      value: specialization,
                      child: Text(specialization),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedSpecialization = value;
                    });
                  },

                  validator: (value) {
                    if (!isPatient && value == null) {
                      return "Select specialization";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),
              ],

              // Username
              TextFormField(
                controller: usernameController,

                decoration: const InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter username";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Password
              TextFormField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }

                  if (value.length < 6) {
                    return "Password must contain at least 6 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Confirm Password
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm password";
                  }

                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed: signup,

                  child: Text(
                    isPatient
                        ? "Create Patient Account"
                        : "Create Doctor Account",

                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Already have an account? "),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
