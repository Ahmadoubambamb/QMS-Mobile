import 'package:flutter/material.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});
  @override
  State<PageAcceuil> createState() => _StatePageAcceuil();
}

class _StatePageAcceuil extends State<PageAcceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          logoBorderOval(),
          Expanded(
            child: Container(color: Colors.white), // reste de l'écran
          ),
        ],
      ),
    );
  }

  ClipPath logoBorderOval() {
    return ClipPath( 
      clipper: HeaderClipper(),
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)], // dégradé
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child:Image.asset(  
            'images/logo.png', // chemin vers votre logo
            width: 350,
            height: 350,
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
 //courbe de l'ovale vers la droite
 @override
  Path getClip(Size size) {
    Path path = Path();

    // Descente verticale bien droite
    path.lineTo(0, size.height - 60);

    // Courbe au centre, sans toucher les coins
    path.quadraticBezierTo(
      size.width / 2, size.height, // Point de contrôle (bas centre)
      size.width, size.height - 60, // Fin à droite
    );

    // Remonter tout droit
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
