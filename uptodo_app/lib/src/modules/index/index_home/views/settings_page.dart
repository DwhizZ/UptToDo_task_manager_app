import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Settings"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            _profileTiles(Icons.brush_outlined, "Change app color", () {}),
            const SizedBox(
              height: 20.0,
            ),
            _profileTiles(
                Icons.type_specimen_outlined, "Change app language", () {}),
            const SizedBox(
              height: 20.0,
            ),
            _profileTiles(
              Icons.translate_outlined,
              "Change app Typograpy",
              () {},
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Align(alignment: Alignment.topLeft, child: Text("Import")),
            const SizedBox(
              height: 25.0,
            ),
            _profileTiles(
              Icons.system_update_alt_rounded,
              "Import from Google calender",
              () {},
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileTiles(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22.0),
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
