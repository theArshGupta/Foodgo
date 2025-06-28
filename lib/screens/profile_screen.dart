// 📁 lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 👤 Profile Header
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/marvelcentral/images/9/97/Tony-Stark.jpg/revision/latest?cb=20130429010603',
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Tony_stark',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'I_love_you_3000@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),

          // 📁 Account Section
          const Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildListTile(context, Icons.edit, 'Edit Profile'),
          _buildListTile(context, Icons.location_on, 'Saved Addresses'),
          _buildListTile(context, Icons.payment, 'Payments'),

          const SizedBox(height: 24),

          // ⚙️ Settings Section
          const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildListTile(context, Icons.notifications, 'Notifications'),
          _buildListTile(context, Icons.language, 'Language'),

          // 🌙 Dark Mode Switch
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (val) => themeProvider.toggleTheme(val),
            secondary: const Icon(Icons.dark_mode),
          ),

          const SizedBox(height: 24),

          // 🚪 Logout
          Center(
            child: TextButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Logged Out"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                "Log out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(
          content: Text("$title Selected"),
          duration: const Duration(milliseconds: 800), // Shorter duration
        ));
      },
    );
  }
}
