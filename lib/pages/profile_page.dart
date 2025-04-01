import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/navigate_drawer.dart';
import 'package:donut_app_2b_moheno/screen/login/update_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user; // Variable para almacenar el usuario autenticado
  User? user = FirebaseAuth.instance.currentUser;
  

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Cargar datos del usuario al iniciar la pantalla
  }

  void _loadUserData() {
    setState(() {
      _user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.grey[800]),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "lib/icons/icons/user.png",
                      
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      "Tu perfil",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _user?.displayName ?? "Usuario sin nombre",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Tarjeta de Correo Electrónico
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffd7d5d5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Correo",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _user?.email ?? "No registrado",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _user?.emailVerified == true ? "Verificado" : "No verificado",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 11,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.push(const UpdatePasswordScreen());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: TColor.primaryText,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                            child: Text(
                                              "Editar",
                                              style: TextStyle(
                                                color: TColor.tertiary,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Espaciado
                        const SizedBox(width: 20),

                        // Tarjeta de Teléfono
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffd7d5d5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Teléfono",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _user?.phoneNumber ?? "No registrado",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _user?.phoneNumber != null ? "Confirmado" : "Sin confirmar",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 11,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Implementar lógica para editar número de teléfono
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: TColor.primaryText,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                            child: Text(
                                              "Editar",
                                              style: TextStyle(
                                                color: TColor.tertiary,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Newsletter
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xff333242),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "lib/icons/icons/d1.png",
                            width: double.maxFinite,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Text(
                                  "Subscríbete a nuestro newsletter",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Obtén noticias de la app",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
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
