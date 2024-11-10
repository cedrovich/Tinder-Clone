import 'package:flutter/material.dart';
import '../models/AppUser.dart';

class MatchesScreen extends StatelessWidget {
  final List<AppUser> matches = [
    AppUser(
      id: '5',
      name: 'Diana',
      age: 26,
      bio: 'Travel enthusiast and foodie',
      images: [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
      ],
      interests: [],
    ),
    // Más coincidencias...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(match.images[0]),
              radius: 30,
            ),
            title: Text(
              "${match.name}, ${match.age}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            subtitle: Text(
              match.bio,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(Icons.chat_bubble_outline, color: Colors.redAccent),
            onTap: () {
              // Navegar al chat
            },
          );
        },
      ),
    );
  }
}
