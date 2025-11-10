import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_text_field.dart';
import '../screens/otp_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Título principal
              Text(
                'TuServicio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 30),

              // Card principal
              CustomCard(
                borderColor: AppColors.textBody.withOpacity(0.2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Regístrate',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ingresa tu número de teléfono para comenzar.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: AppColors.textBody),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 25),

                    Text(
                      'Número de Teléfono',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    // Campo de texto para el número
                    CustomTextField(
                      controller: phoneController,
                      label: 'Número de Teléfono',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 25),

                    // Botón enviar OTP
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Enviar Código OTP',
                        onPressed: () {
                          final phone = phoneController.text.trim();
                          if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Por favor ingresa tu número de teléfono',
                                ),
                              ),
                            );
                          } else {
                            print('Enviando OTP a $phone');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          }
                        },
                        backgroundColor: AppColors.primary,
                        pressedBackgroundColor: Colors.white,
                        pressedTextColor: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Enlace para iniciar sesión
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes cuenta? ',
                          style: TextStyle(color: AppColors.textBody),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Inicia sesión',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
