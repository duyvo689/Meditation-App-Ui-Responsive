import 'package:flutter/material.dart';

import 'themes.dart';

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Flexible(flex: 1, fit: FlexFit.tight, child: _Header()),
          Flexible(
              flex: 3,
              child: Container(
                color: Colors.red,
              ))
        ],
      ),
    ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'What brings you\n',
                style: PrimaryFont.medium(size.height * 0.03)
                    .copyWith(color: Colors.black, height: 1.3),
                children: <TextSpan>[
                  TextSpan(
                      text: 'to Silent Moon?',
                      style: PrimaryFont.thin(size.height * 0.03)
                          .copyWith(color: Colors.black)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text('choose a topic to focus on',
                style: PrimaryFont.light(size.height * 0.022)
                    .copyWith(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
