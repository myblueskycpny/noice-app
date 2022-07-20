import 'package:flutter/material.dart';

class LanjutDengerin extends StatelessWidget {
  final String name;
  final String linkImage;
  const LanjutDengerin({Key? key, required this.name, required this.linkImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image:  NetworkImage(linkImage)),
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            width: 130,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
