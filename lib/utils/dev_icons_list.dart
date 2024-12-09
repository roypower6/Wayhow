import 'package:flutter/material.dart';
import 'package:dev_icons/dev_icons.dart';

class DevIconsUtils {
  static final List<String> devIcons = [
    'flutterPlain',
    'reactOriginal',
    'angularjsPlain',
    'vuejsPlain',
    'nodejsPlain',
    'pythonPlain',
    'javaPlain',
    'kotlinPlain',
    'swiftPlain',
    'javascriptPlain',
    'typescriptPlain',
    'goPlain',
    'rustPlain',
    'dartPlain',
    'cPlain',
    'cplusplusPlain',
    'csharpPlain',
    'phpPlain',
    'rubyPlain',
    'perlPlain',
    'mysqlPlain',
    'postgresqlPlain',
    'mongodbPlain',
    'firebasePlain',
    'electronOriginal',
    'html5Plain',
    'css3Plain',
    'sassOriginal',
    'bootstrapPlain',
    'figmaPlain',
    'luaPlain',
    'nestjsPlain',
    'expressOriginal',
    'djangoPlain',
    'laravelPlain',
    'springPlain',
    'rPlain',
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
      default:
        return Icons.code;
    }
  }
}
