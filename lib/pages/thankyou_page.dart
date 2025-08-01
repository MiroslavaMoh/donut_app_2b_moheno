import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/pages/supermarket_page.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Puedes personalizar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset( //Imagen principal
                "lib/icons/icons/donut_float.png", 
                
                width: double.maxFinite,
                height: 200 , 
                fit: BoxFit.fitHeight, 
              ),

              SizedBox(height: 20),
              Text(
                "¡Gracias por tu compra!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                "En breve sera alimentado <3",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              
              SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SuperMarketPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Volver al inicio", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            )

            ],
          ),
        ),
      ),
    );
  }
}