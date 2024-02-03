import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Calender",
          style: TextStyle(fontSize: 28),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          width: double.infinity,
          height: 107,
          color: const Color(0xFf363636),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const Column(
                    children: [
                      Text(
                        "FEBRUARY",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "2023",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              _buildCalenderDay(),
            ],
          ),
        ),

        //
      ],
    );
  }

  Widget _buildCalenderDay( ) {
    return Container(
      height: 48,
      width: 42,
      decoration: const BoxDecoration(
        color: Color(0xFF272727),
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text("SUN"),
            Text("6"),
          ],
        ),
      ),
    );
  }
}
