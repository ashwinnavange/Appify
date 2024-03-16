import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/screen_size.dart';

class TopCharts extends StatefulWidget {
  const TopCharts({super.key});

  @override
  State<TopCharts> createState() => _TopChartsState();
}

class _TopChartsState extends State<TopCharts> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileTopChartSection(context),
      desktop: (BuildContext context) => DesktopTopChartSection(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileTopChartSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.w * 0.05,
      ),
      width: ScreenSize.w,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
              alignment: Alignment.centerLeft, child: Text("Top Charts")),
          20.ph,
          SwitchButtons(),
          20.ph,
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopTopChartSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.w * 0.1,
        ),
        color: Colors.blue,
        width: ScreenSize.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
                alignment: Alignment.centerLeft, child: Text("Top Charts")),
            20.ph,
            SwitchButtons(),
            20.ph,
          ],
        ));
  }

  Widget SwitchButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Top Apps",
            maxLines: 2,
          ),
        ),
        20.pw,
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Top Games",
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
