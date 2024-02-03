import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AuthenticationProvider>().user!;
    return Column(
      children: [
        const Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const CircleAvatar(
          radius: 40,
          child: Icon(
            Icons.person,
            size: 45,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          data.email ?? "__",
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                height: 58,
                width: 154,
                decoration: BoxDecoration(
                  color: const Color(0xFF363636),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(child: Text("Task left")),
              ),
              const Spacer(),
              Container(
                height: 58,
                width: 154,
                decoration: BoxDecoration(
                  color: const Color(0xFF363636),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(child: Text("Task done")),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        _profileTiles(Icons.person_outline, "Profile"),
        const SizedBox(
          height: 15.0,
        ),
        _profileTiles(Icons.settings_outlined, "Settings"),
        const SizedBox(
          height: 15.0,
        ),
        _profileTiles(Icons.logout, "Logout"),
      ],
    );
  }

  Widget _profileTiles(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 37.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16.0),
          ),
          const Spacer(),
          const Icon(
            Icons.chevron_right,
            size: 24,
          )
        ],
      ),
    );
  }
}
