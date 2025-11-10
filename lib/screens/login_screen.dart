import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import 'register_screen.dart';


class LoginScreen extends StatelessWidget {
	const LoginScreen({super.key});

	@override
	Widget build(BuildContext context) {
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
									mainAxisSize: MainAxisSize.min,
									crossAxisAlignment: CrossAxisAlignment.center,
									children: [
										Text(
											'¡Bienvenido a TuServicio!',
											style: TextStyle(
												color: AppColors.primary,
												fontSize: 27,
												fontWeight: FontWeight.bold,
											),
											textAlign: TextAlign.center,
										),
										const SizedBox(height: 4),
										Text(
											'Conectando residentes con servicios de confianza.',
												maxLines: 1,
												overflow: TextOverflow.ellipsis,
											style: TextStyle(
												color: AppColors.textBody,
												fontSize: 14,
												fontWeight: FontWeight.w400,
											),
											textAlign: TextAlign.center,
										),
										const SizedBox(height: 50),

										// Botón Iniciar Sesión
										SizedBox(
											width: double.infinity,
											child: CustomButton(
												text: 'Iniciar Sesión',
												onPressed: () {},
											),
										),
										const SizedBox(height: 20),

										// Botón Regístrate
										SizedBox(
											width: double.infinity,
											child: CustomButton(
												text: 'Regístrate',
												backgroundColor: AppColors.primary,
												textColor: Colors.white,
												pressedBackgroundColor: Colors.white,
												pressedTextColor: AppColors.primary,
												onPressed: () {print('Registro presionado');
													Navigator.push(
													context,
													MaterialPageRoute(builder: (context) => const RegisterScreen()),
													);
												},
											),
										),
										const SizedBox(height: 40),

										// Texto de proveedor
										RichText(
											textAlign: TextAlign.center,
											text: TextSpan(
												style: TextStyle(
													fontSize: 14,
													color: AppColors.textBody,
												),
												children: [
													const TextSpan(
														text: '¿Eres un proveedor de servicios? ',
													),
													TextSpan(
														text: 'Inicia sesión aquí.',
														style: TextStyle(
															color: AppColors.primary,
															fontWeight: FontWeight.bold,
														),
													),
												],
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
