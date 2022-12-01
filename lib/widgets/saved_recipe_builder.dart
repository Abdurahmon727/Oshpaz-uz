import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var savedRecipe = Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: double.infinity,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text(''), Text('Food'), Icon(Icons.share)],
          ),
          Text('Olivie', style: GoogleFonts.oregano(fontSize: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.outdoor_grill,
                    size: 20,
                  ),
                  Text('45 min'),
                ],
              ),
              Row(children: const [
                Icon(
                  Icons.local_fire_department,
                  size: 20,
                ),
                Text('100 cal'),
              ]),
              Text('              ')
            ],
          )
        ],
      ),
    ),
    Positioned(
      bottom: 40,
      left: -20,
      child: Image.asset(
        'images/olivie.png',
        height: 150,
        width: 150,
      ),
    ),
  ],
);
