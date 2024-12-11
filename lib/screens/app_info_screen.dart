import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앱 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '앱 설명',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Wayhow는 개발자들이 생각나는 아이디어를 빠르게 적어 관리할 수 있도록 만든 개발 아이디어 메모 앱입니다.\n'
              '상태 관리 라이브러리로 GetX 라이브러리를 사용하였습니다.\n'
              '앱을 이용해 주셔서 감사합니다.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '이 앱은 다음 언어를 통해 만들어졌습니다.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(DevIcons.flutterPlain),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Flutter (Dart)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '개발자 정보',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(UniconsLine.github),
                SizedBox(width: 10),
                Text(
                  'roypower6',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(UniconsLine.fast_mail_alt),
                SizedBox(width: 10),
                Text(
                  'roy040707@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Divider(color: Colors.grey),
                  Text(
                    'Thank you for using Wayhow!',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
