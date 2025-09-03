import 'package:flutter/material.dart';
import 'package:flutter_store_app/core/gen/assets.gen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.2,
      child: Stack(
        children: [
          Image.asset(
            Assets.icons.searchBanner.path,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            left: 48,
            top: 68,
            child: SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Text',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff7f7f7f),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  prefixIcon: Image.asset(Assets.icons.searc1.path),
                  suffixIcon: Image.asset(Assets.icons.cam.path),
                  fillColor: Colors.grey,
                  filled: true,
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 311,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                // overlayColor: WidgetStateProperty.all(
                //   Color(0x0c7f7f),
                // ),
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.icons.bell.path),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 354,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.icons.message.path),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
