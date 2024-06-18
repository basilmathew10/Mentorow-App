import 'package:flutter/material.dart';

Widget buttonCard(String text,BuildContext context){
  return Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height*0.05,
                    // width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink.shade100,
                    ),
                    child:  Center(
                      child: Text(text,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.pinkAccent.shade700,
                        letterSpacing: 1
                        
                      ),),
                    ),
                  );
}