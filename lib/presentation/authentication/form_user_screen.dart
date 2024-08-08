import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FormUserScreen extends StatefulWidget {
  static const name = 'form-user-screen';
  const FormUserScreen({super.key});

  @override
  State<FormUserScreen> createState() => _FormUserScreenState();
}

class _FormUserScreenState extends State<FormUserScreen> {
  final nombresController = TextEditingController();
  final apellidosController = TextEditingController();
  final correoController = TextEditingController();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleAceptar() {
    if (nombresController.text.isEmpty ||
        apellidosController.text.isEmpty ||
        correoController.text.isEmpty ||
        usuarioController.text.isEmpty ||
        contrasenaController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Por favor complete todos los campos.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.shade400,
      );
    } else if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Fluttertoast.showToast(
        msg: 'Registro exitoso.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green.shade400,
      );
      // Redirecciona al login después del registro exitoso
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background-form-user.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.zero,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.02,
              heightFactor: 0.75,
              child: Card(
                elevation: 50,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Formulario',
                          style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        _buildInputField(
                          controller: nombresController,
                          hintText: 'Nombres',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 15),
                        _buildInputField(
                          controller: apellidosController,
                          hintText: 'Apellidos',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 15),
                        _buildInputField(
                          controller: correoController,
                          hintText: 'Correo',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 15),
                        _buildInputField(
                          controller: usuarioController,
                          hintText: 'Usuario',
                          icon: Icons.account_circle,
                        ),
                        const SizedBox(height: 15),
                        _buildInputField(
                          controller: contrasenaController,
                          hintText: 'Contraseña',
                          icon: Icons.lock,
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          child: _buildButton(
                            buttonText: "Aceptar ",
                            onPressed: handleAceptar,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: colors.primary),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: colors.primary),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButton({
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: colors.primary,
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.outfit(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
