import 'package:flutter/material.dart';

class EpisodeTerbaru extends StatelessWidget {
  final String name;
  final String linkImage;
  const EpisodeTerbaru({Key? key, required this.name, required this.linkImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 155,
            decoration: BoxDecoration(
                image: DecorationImage(image:  NetworkImage(linkImage)),
                borderRadius: BorderRadius.circular(10)
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
