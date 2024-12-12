import 'package:flutter/material.dart';
import 'package:dev_icons/dev_icons.dart';

// 개발 아이콘 리스트
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
    'gulpPlain', // JavaScript Framework

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
    'oracleOriginal', // Relational Database

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

  // 개발 아이콘 이름 매핑
  static String getDevIconName(String icon) {
    switch (icon) {
      case 'flutterPlain':
        return 'Flutter';
      case 'reactOriginal':
        return 'React';
      case 'angularjsPlain':
        return 'Angular';
      case 'vuejsPlain':
        return 'Vue.js';
      case 'nodejsPlain':
        return 'Node.js';
      case 'pythonPlain':
        return 'Python';
      case 'javaPlain':
        return 'Java';
      case 'kotlinPlain':
        return 'Kotlin';
      case 'swiftPlain':
        return 'Swift';
      case 'javascriptPlain':
        return 'JavaScript';
      case 'typescriptPlain':
        return 'TypeScript';
      case 'goPlain':
        return 'Go';
      case 'rustPlain':
        return 'Rust';
      case 'dartPlain':
        return 'Dart';
      case 'cPlain':
        return 'C';
      case 'cplusplusPlain':
        return 'C++';
      case 'csharpPlain':
        return 'C#';
      case 'phpPlain':
        return 'PHP';
      case 'rubyPlain':
        return 'Ruby';
      case 'perlPlain':
        return 'Perl';
      case 'mysqlPlain':
        return 'MySQL';
      case 'postgresqlPlain':
        return 'PostgreSQL';
      case 'mongodbPlain':
        return 'MongoDB';
      case 'firebasePlain':
        return 'Firebase';
      case 'electronOriginal':
        return 'Electron';
      case 'html5Plain':
        return 'HTML5';
      case 'css3Plain':
        return 'CSS3';
      case 'sassOriginal':
        return 'Sass';
      case 'bootstrapPlain':
        return 'Bootstrap';
      case 'figmaPlain':
        return 'Figma';
      case 'luaPlain':
        return 'Lua';
      case 'nestjsPlain':
        return 'NestJS';
      case 'expressOriginal':
        return 'Express';
      case 'djangoPlain':
        return 'Django';
      case 'laravelPlain':
        return 'Laravel';
      case 'springPlain':
        return 'Spring';
      case 'rPlain':
        return 'R';
      case 'matlabPlain':
        return 'MATLAB';
      case 'groovyPlain':
        return 'Groovy';
      case 'flaskOriginal':
        return 'Flask';
      case 'objectivecPlain':
        return 'Objective-C';
      case 'scalaPlain':
        return 'Scala';
      case 'nextjsOriginal':
        return 'Next.js';
      case 'photoshopPlain':
        return 'Photoshop';
      case 'illustratorPlain':
        return 'Illustrator';
      case 'xdPlain':
        return 'Adobe XD';
      case 'gulpPlain':
        return 'Gulp';
      case 'oracleOriginal':
        return 'Oracle Database';
      default:
        return 'Unknown';
    }
  }

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
      case 'gulpPlain':
        return DevIcons.gulpPlain;
      case 'oracleOriginal':
        return DevIcons.oracleOriginal;
      default:
        return Icons.code;
    }
  }
}
