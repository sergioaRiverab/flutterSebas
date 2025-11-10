import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'TuServicio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 30),

              CustomCard(
                borderColor: AppColors.textBody.withOpacity(0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Establecer Contraseña',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Crea una contraseña segura para tu cuenta.',
                      style: TextStyle(fontSize: 15, color: AppColors.textBody),
                    ),
                    const SizedBox(height: 30),

                    Text(
                      'Contraseña',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    CustomTextField(
                      controller: passwordController,
                      label: 'Contraseña',
                      obscureText: true,
                      borderColor: AppColors.textBody.withOpacity(0.2),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'Confirmar Contraseña',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: confirmController,
                      label: 'Confirmar Contraseña',
                      obscureText: true,
                      borderColor: AppColors.textBody.withOpacity(0.2),
                    ),
                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Crear Cuenta',
                        onPressed: () {
                          final password = passwordController.text.trim();
                          final confirm = confirmController.text.trim();

                          if (password.isEmpty || confirm.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Por favor completa ambos campos.'),
                              ),
                            );
                          } else if (password != confirm) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Las contraseñas no coinciden.'),
                              ),
                            );
                          } else {
                            print('Contraseña establecida: $password');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}