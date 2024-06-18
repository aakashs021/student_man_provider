import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management/core/styles/colors.dart';
import 'package:student_management/student%20model/student_model.dart';

Container firstdivisiondetailpage(StudentModel sd) {
  return Container(
    height: 300,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF43C6AC),
          Color.fromARGB(255, 212, 225, 78),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 4),
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          child: sd.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    File(sd.image!),
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        width: 100, 'assets/lotties/camera_not_found.json'),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      width: 120,
                      child: Text(
                        style: TextStyle(color: Colors.black),
                        'No image found',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 10),
        Text(
          sd.name,
          style: const TextStyle(
            color: white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          sd.standard,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
