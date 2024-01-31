import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function(TimeOfDay value) onTap;
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'CHOOSE TIME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );

                    if (selectedTime != null) {
                      setState(() {
                        _selectedTime = selectedTime;
                      });
                    }
                  },
                  child: Text(
                    _selectedTime.format(context),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel button pressed
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your code for saving the selected time
                    // _selectedTime contains the selected time
                    widget.onTap(_selectedTime);
                    Navigator.pop(context); // Close the dialog after saving
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
