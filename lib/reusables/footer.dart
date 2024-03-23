import 'package:flutter/material.dart';
import 'package:appify/utils/screen_size.dart';
import 'package:appify/utils/theme.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.w >= 950 ? ScreenSize.w * 0.1 : ScreenSize.w * 0.05,
        vertical: ScreenSize.h * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRow('Appify', 'By'),
          _buildRow('A platform to showcase your apps to the world.', 'Ashwin Navange'),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: CTS.h1(26, color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            textAlign: TextAlign.end,
            subtitle,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: CTS.h1(26, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
