import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/AppUser.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final List<AppUser> users = [
    
    AppUser(
      id: '1',
      name: 'Jax',
      age: 25,
      bio: 'Skater and photographer',
      images: [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      ],
      interests: ['Leo', 'Non-Smoker', 'Cat'],
    ),
    AppUser(
      id: '2',
      name: 'Alice',
      age: 28,
      bio: 'Adventure lover and coffee enthusiast',
      images: [
        'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      ],
      interests: ['Travel', 'Photography', 'Yoga'],
    ),
    AppUser(
      id: '3',
      name: 'John',
      age: 30,
      bio: 'Foodie and music lover',
      images: [
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      ],
      interests: ['Cooking', 'Gym', 'Music'],
    ),
    // Más usuarios si lo deseas
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth < 500 ? screenWidth * 0.9 : 400;
    double cardHeight = cardWidth * 1.6;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Tinder", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Acción para notificaciones
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Cierra la sesión y regresa a la pantalla de inicio de sesión
              Provider.of<AuthService>(context, listen: false).signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: cardWidth,
                child: Swiper(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = users[index];
                    return Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          Image.network(
                            user.images[index % user.images.length], // Cambia entre fotos del usuario
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: cardHeight,
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user.name}, ${user.age}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: user.interests
                                      .map((interest) => Padding(
                                            padding: const EdgeInsets.only(right: 4.0),
                                            child: Chip(
                                              label: Text(interest),
                                              backgroundColor: Colors.grey[800],
                                              labelStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  layout: SwiperLayout.STACK,
                  itemWidth: cardWidth,
                  itemHeight: cardHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.undo, color: Colors.yellow),
                  iconSize: 25,
                  onPressed: () {
                    // Acción para deshacer el swipe
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.times, color: Colors.red),
                  iconSize: 30,
                  onPressed: () {
                    // Acción para "No me gusta"
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.solidStar, color: Colors.blue),
                  iconSize: 25,
                  onPressed: () {
                    // Acción para "Super Like"
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.heart, color: Colors.green),
                  iconSize: 30,
                  onPressed: () {
                    // Acción para "Me gusta"
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.bolt, color: Colors.purple),
                  iconSize: 25,
                  onPressed: () {
                    // Acción para "Boost"
                  },
                ),
              ],
            ),
          ),
          // Barra de navegación
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.whatshot, color: Colors.white),
                  onPressed: () {
                    // Acción para home
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white70),
                  onPressed: () {
                    // Acción para explorar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: Colors.white70),
                  onPressed: () {
                    // Acción para ir a matches
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person_outline, color: Colors.white70),
                  onPressed: () {
                    // Navegar a la pantalla de configuración de perfil
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
