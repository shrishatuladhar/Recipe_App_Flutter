import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final Color color;

  const StatusBar({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:59',
            style: TextStyle(
              color: color,
              fontSize: 18.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.signal_cellular_alt,
                color: color,
                size: 20.0,
              ),
              SizedBox(width: 10.0),
              Icon(
                Icons.sim_card,
                color: color,
                size: 20.0,
              ),
              SizedBox(width: 10.0),
              Icon(
                Icons.network_wifi,
                color: color,
                size: 20.0,
              ),
              SizedBox(width: 10.0),
              Icon(
                Icons.battery_std,
                color: color,
                size: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
