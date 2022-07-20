import 'package:flutter/material.dart';

class subJudul extends StatelessWidget {
  final String title;

  const subJudul({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 19),
          ),
        ],
      ),
    );
  }
}
