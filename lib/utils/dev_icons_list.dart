import 'package:flutter/material.dart';
import 'package:dev_icons/dev_icons.dart';

class DevIconsUtils {
  static final List<String> devIcons = [
    // Most Popular Languages
    'pythonPlain', // Data Science, AI, Web, Versatile
    'javascriptPlain', // Web Development
    'typescriptPlain', // Modern Web Development
    'javaPlain', // Enterprise, Android
    'csharpPlain', // Windows, Game Development
    'cplusplusPlain', // System Programming, Game Development
    'cPlain', // Low-level Programming
    'scalaPlain', // Scala

    // Web Frameworks
    'angularjsPlain', // Web Frontend
    'vuejsPlain', // Web Frontend
    'nestjsPlain', // Backend Framework
    'expressOriginal', // Backend Framework
    'djangoPlain', // Python Web Framework
    'laravelPlain', // PHP Web Framework
    'springPlain', // Java Web Framework
    'flaskOriginal', // Python Web Framework

    // Web and Mobile Frameworks
    'reactOriginal', // Web Frontend
    'flutterPlain', // Cross-platform Mobile
    'nodejsPlain', // Backend JavaScript
    'dartPlain', // Flutter Language
    'kotlinPlain', // Modern Android
    'swiftPlain', // iOS Development
    'objectivecPlain', // Objective-C
    'nextjsOriginal', // Next.js

    // Other Popular Languages
    'goPlain', // Systems Programming, Cloud
    'rustPlain', // Systems Programming, Safety
    'phpPlain', // Web Backend
    'rubyPlain', // Web Backend

    // Web Technologies
    'html5Plain', // Web Structure
    'css3Plain', // Web Styling
    'sassOriginal', // CSS Preprocessor
    'bootstrapPlain', // Frontend Framework

    // Databases and Backend
    'mysqlPlain', // Relational Database
    'postgresqlPlain', // Advanced Relational Database
    'mongodbPlain', // NoSQL Database
    'firebasePlain', // Backend as a Service

    // Other Technologies
    'electronOriginal', // Desktop Apps
    'figmaPlain', // Design Tool
    'matlabPlain', // Math
    'xdPlain', // Design Tool
    'illustratorPlain', // Design Tool
    'photoshopPlain', // Design Tool

    // Less Common Languages
    'perlPlain', // Text Processing
    'luaPlain', // Scripting
    'rPlain', // Statistical Computing
  ];

  static IconData getDevIconFromString(String icon) {
    switch (icon) {
      case 'flutterPlain':
        return DevIcons.flutterPlain;
      case 'reactOriginal':
        return DevIcons.reactOriginal;
      case 'angularjsPlain':
        return DevIcons.angularjsPlain;
      case 'vuejsPlain':
        return DevIcons.vuejsPlain;
      case 'nodejsPlain':
        return DevIcons.nodejsPlain;
      case 'pythonPlain':
        return DevIcons.pythonPlain;
      case 'javaPlain':
        return DevIcons.javaPlain;
      case 'kotlinPlain':
        return DevIcons.kotlinPlain;
      case 'swiftPlain':
        return DevIcons.swiftPlain;
      case 'javascriptPlain':
        return DevIcons.javascriptPlain;
      case 'typescriptPlain':
        return DevIcons.typescriptPlain;
      case 'goPlain':
        return DevIcons.goPlain;
      case 'rustPlain':
        return DevIcons.rustPlain;
      case 'dartPlain':
        return DevIcons.dartPlain;
      case 'cPlain':
        return DevIcons.cPlain;
      case 'cplusplusPlain':
        return DevIcons.cplusplusPlain;
      case 'csharpPlain':
        return DevIcons.csharpPlain;
      case 'phpPlain':
        return DevIcons.phpPlain;
      case 'rubyPlain':
        return DevIcons.rubyPlain;
      case 'perlPlain':
        return DevIcons.perlPlain;
      case 'mysqlPlain':
        return DevIcons.mysqlPlain;
      case 'postgresqlPlain':
        return DevIcons.postgresqlPlain;
      case 'mongodbPlain':
        return DevIcons.mongodbPlain;
      case 'firebasePlain':
        return DevIcons.firebasePlain;
      case 'electronOriginal':
        return DevIcons.electronOriginal;
      case 'html5Plain':
        return DevIcons.html5Plain;
      case 'css3Plain':
        return DevIcons.css3Plain;
      case 'sassOriginal':
        return DevIcons.sassOriginal;
      case 'bootstrapPlain':
        return DevIcons.bootstrapPlain;
      case 'figmaPlain':
        return DevIcons.figmaPlain;
      case 'luaPlain':
        return DevIcons.luaPlain;
      case 'nestjsPlain':
        return DevIcons.nestjsPlain;
      case 'expressOriginal':
        return DevIcons.expressOriginal;
      case 'djangoPlain':
        return DevIcons.djangoPlain;
      case 'laravelPlain':
        return DevIcons.laravelPlain;
      case 'springPlain':
        return DevIcons.springPlain;
      case 'rPlain':
        return DevIcons.rPlain;
      case 'matlabPlain':
        return DevIcons.matlabPlain;
      case 'groovyPlain':
        return DevIcons.groovyPlain;
      case 'flaskOriginal':
        return DevIcons.flaskOriginal;
      case 'objectivecPlain':
        return DevIcons.objectivecPlain;
      case 'scalaPlain':
        return DevIcons.scalaPlain;
      case 'nextjsOriginal':
        return DevIcons.nextjsOriginal;
      case 'photoshopPlain':
        return DevIcons.photoshopPlain;
      case 'illustratorPlain':
        return DevIcons.illustratorPlain;
      case 'xdPlain':
        return DevIcons.xdPlain;
      default:
        return Icons.code;
    }
  }
}
