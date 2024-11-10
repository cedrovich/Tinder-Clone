import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.currentUser;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${user?.displayName ?? 'User'}, ${user?.email ?? ''}",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.black,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.share, color: Colors.white),
                        title: Text("Share", style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.block, color: Colors.white),
                        title: Text("Block", style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.report, color: Colors.red),
                        title: Text("Report", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Me Section
              const SizedBox(height: 16),
              const Text(
                "About me",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                user?.displayName != null ? "Hi, I'm ${user!.displayName}" : '',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              // Interests Section (Placeholder - Adjust this as needed)
              const SizedBox(height: 16),
              const Text(
                "Interests",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: const Text("Example Interest"),
                    backgroundColor: Colors.grey[700],
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                  // Puedes añadir más chips de intereses aquí según lo necesites.
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
