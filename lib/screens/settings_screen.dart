import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Settings", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Done",
                style: TextStyle(color: Colors.redAccent, fontSize: 16)),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSectionHeader("Account Settings"),
          _buildListItem(context, "Manage Payment Account"),
          _buildListItem(context, "Restore Purchases"),
          Divider(color: Colors.grey),
          _buildSectionHeader("Account Information"),
          _buildListItem(context, "Email", subtitle: "youremail@example.com"),
          _buildListItem(context, "Phone Number", subtitle: "123-456-7890"),
          Divider(color: Colors.grey),
          _buildSectionHeader("Discovery Settings"),
          _buildListItem(context, "Location", subtitle: "Your location"),
          Divider(color: Colors.grey),
          // Puedes añadir más opciones aquí
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title,
      {String? subtitle}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Colors.white54, fontSize: 14),
            )
          : null,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
      onTap: () {
        // Acción para cada opción
      },
    );
  }
}
