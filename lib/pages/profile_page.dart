
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/navigate_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //BTN-menu
        drawer: MyDrawer(), // Usa el widget del navigate drawer no olvidar importar
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
          //Fin BTN-menu
              
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
                    const SizedBox(
                      height: 8, 
                    ),
                    Text(
                      "Miroslava Moheno",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      //Primera tarjeta - morada
                      children: [
                        Expanded(
                            child: InkWell( //Para hacer tap, se requiere material
                          onTap: () {
                            //context.push(const CourseDetailScreen());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffd7d5d5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Correo",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "miroslavamoh252***",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Activo",
                                              style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 11,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: TColor.primaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 15),
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),

                        //Espaciado entre tarjetas
                        const SizedBox(
                          width: 20,
                        ),

                        //Segunda tarjeta - amarilla
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            //context.push(const CourseDetailScreen());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffd7d5d5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Teléfono",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "9381025***",
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Sin confirmar",
                                              style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 11,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: TColor.primaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 15),
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        )
                      ],
                    ),


                    const SizedBox(height: 20,),

                    //Fila
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Subcribete a nuestro newsletter",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Obten noticias de la app",
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    //Nueva sección deslizable con fichas hechas a partir de la lista de aribba
                    
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