import 'package:appify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../utils/screen_size.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileImageSection(context),
      desktop: (BuildContext context) => DesktopImageSection(context),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MobileImageSection(BuildContext context) {
    return Container(
      height: ScreenSize.w > 700 ? ScreenSize.h * 1.2 : ScreenSize.h * 1.55,
      width: ScreenSize.w,
      child: Center(
          child: Stack(
        children: [
          Positioned(
            bottom: ScreenSize.h * 0.3,
            child: Image(
              image: AssetImage('images/dashboard_bgi.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: ScreenSize.h * 0.08,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Do more\n  with apps",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    height: 1.1),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.h * 0.35,
            child: Container(
              height: ScreenSize.w > 700 ? ScreenSize.h * 0.7 : ScreenSize.h * 1.15,
              width: ScreenSize.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 214, 211, 209),
                ),
                color: Color.fromARGB(255, 250, 250, 249),
              ),
              child: HeadBoxContent(),
            ),
          ),
        ],
      )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DesktopImageSection(BuildContext context) {
    return Container(
      height: ScreenSize.w > 1350 ? ScreenSize.h * 0.8 : ScreenSize.h * 1.2,
      width: ScreenSize.w,
      child: Center(
          child: Stack(
        children: [
          Positioned(
            bottom: ScreenSize.h * 0.3,
            child: Image(
              image: AssetImage('images/dashboard_bgi.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: ScreenSize.h * 0.08,
            left: ScreenSize.w * 0.08,
            right: ScreenSize.w * 0.08,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Do more\n  with apps",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    height: 1.1),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.h * 0.35,
            left: ScreenSize.w * 0.07,
            right: ScreenSize.w * 0.07,
            child: Container(
              height: ScreenSize.w > 1350 ? ScreenSize.h * 0.4 : ScreenSize.h * 0.7,
              width: ScreenSize.w * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 214, 211, 209),
                ),
                color: Color.fromARGB(255, 250, 250, 249),
              ),
              child: HeadBoxContent(),
            ),
          ),
        ],
      )),
    );
  }

  Widget HeadBoxContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.h * 0.05, horizontal: ScreenSize.w * 0.035),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular with developers across Appify",
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          20.ph,
          GridView.builder(
            itemCount: 8,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenSize.w > 1350 ? 4 : ScreenSize.w > 700 ? 2 : 1, childAspectRatio: 3.5, mainAxisExtent:100),
            itemBuilder: (BuildContext context, int index) {
              return HeaderContentCard(context, index);
            },
          )
        ],
      ),
    );
  }

  Widget HeaderContentCard(BuildContext context, int index) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 214, 211, 209),
                ),
                color: Color.fromARGB(255, 250, 250, 249),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(30), // Image radius
                  child: Image.network(
                      'https://cdn.shopify.com/app-store/listing_images/a78e004f44cded1b6998e7a6e081a230/icon/COng2Lf0lu8CEAE=.png',
                      fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Container(
            width: ScreenSize.w > 1350 ? ScreenSize.w * 0.12 : ScreenSize.w > 700 ? ScreenSize.w * 0.25 : ScreenSize.w * 0.6,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Google'),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('4.4'),
                      Icon(Icons.star),
                      Text('•'),
                      Text('Free to install',maxLines: 1,overflow: TextOverflow.fade,)
                    ],
                  ),
                ),
                Text('Short description of Google sdjbhihgius jdbsiubgvs ijubgsiubv higsyb hisb hbs',maxLines: 2,overflow: TextOverflow.ellipsis,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
