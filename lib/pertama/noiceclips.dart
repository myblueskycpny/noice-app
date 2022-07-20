import 'package:flutter/material.dart';

class NoiceClips extends StatelessWidget{
  final String name;
  final String linkImage;
  const NoiceClips({Key? key, required this.name, required this.linkImage}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(image:  NetworkImage(linkImage)),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            width: 90,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
