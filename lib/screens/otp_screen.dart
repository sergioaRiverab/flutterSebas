import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../screens/set_password_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

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
                      'Verificación OTP',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ingresa el código de 4 dígitos enviado a tu teléfono.',
                      style: TextStyle(fontSize: 14, color: AppColors.textBody),
                      //maxLines: 1,
                      //overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 30),

                    Text(
                      'Codigo OTP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    CustomTextField(
                      controller: otpController,
                      label: 'Código OTP',
                      keyboardType: TextInputType.number,
                      borderColor: AppColors.textBody.withOpacity(0.2),
                    ),
                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Verificar',
                        onPressed: () {
                          final otp = otpController.text.trim();
                          if (otp.isEmpty || otp.length != 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Por favor ingresa un código OTP válido',
                                ),
                              ),
                            );
                          } else {
                            print('Verificando OTP: $otp');
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SetPasswordScreen(),
                              ),
                            );

                            
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print('Reenviar código OTP');
                        },
                        child: Text(
                          'Reenviar Código OTP',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
