import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app_ui_responsive/utils/themes.dart';

import 'choose_topic_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Stack(
                alignment: Alignment.topCenter,
                children: [
                  const GetStartedBackground(),
                  const FractionallySizedBox(
                      heightFactor: 0.4, child: GetStartedHeader()),
                  Align(
                    alignment: const Alignment(0.0, 0.8),
                    child: GetStartButton(
                      fixSize: MaterialStateProperty.all(
                          Size(size.width * 0.8, size.height * 0.065)),
                      textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.015)),
                    ),
                  )
                ],
              )
            : Row(
                children: [
                  const Expanded(
                    child: FractionallySizedBox(
                        heightFactor: 0.7, child: GetStartedHeader()),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        const GetStartedBackground(),
                        Align(
                          alignment: const Alignment(0.0, 0.8),
                          child: GetStartButton(
                            fixSize: MaterialStateProperty.all(
                                Size(size.width * 0.36, size.height * 0.065)),
                            textStyle: MaterialStateProperty.all(
                                PrimaryFont.medium(size.height * 0.015)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class GetStartButton extends StatelessWidget {
  const GetStartButton({Key? key, this.fixSize, this.textStyle})
      : super(key: key);

  final MaterialStateProperty<Size>? fixSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      // ignore: sort_child_properties_last
      child: const Text('GET STARTED'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorLightGrey),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixSize,
        foregroundColor: MaterialStateProperty.all(kColorDarkGrey),
        textStyle: textStyle,
      ),
    );
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
            widthFactor: 1,
            child: FittedBox(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                child: SvgPicture.asset('assets/images/bg_get_started.svg'))));
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/images/ic_logo.svg',
              alignment: const Alignment(0.0, -0.8),
            )),
        Expanded(
          flex: 2,
          child: Column(children: [
            Expanded(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Hi Afsar, Welcome\n',
                  style: PrimaryFont.medium(30.0)
                      .copyWith(color: kColorLightYellow, height: 1.3),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'to Silent Moon',
                        style: PrimaryFont.thin(30.0)
                            .copyWith(color: kColorLightYellow)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Explore the app, Find some peace of mind\nto prepare for meditation.',
                style: PrimaryFont.light(16.0)
                    .copyWith(color: kColorLightGrey, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
