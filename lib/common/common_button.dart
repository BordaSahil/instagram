import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/utils/color_res.dart';

Widget elevatedButtonCommon(
    {required void Function()? onPressed, required String text}) {
  return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        fixedSize: MaterialStatePropertyAll(
            Size(Get.width * 0.85, Get.height * 0.060)),
        backgroundColor: MaterialStatePropertyAll(Colors.blue.shade600),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 17, color: ColorsRes.white, fontWeight: FontWeight.bold),
      ));
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final double? minWidth;
  final double? minHeight;
  final FontWeight? fontWeight;
  final Function() onPressed;
  final double? textSize;
  final double? fieldRadius;
  final Color? borderColor;
  final IconData? icon;
  final String? image;
  final String? fontFamily;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    this.textColor,
    this.minWidth,
    required this.onPressed,
    this.textSize,
    this.fontWeight,
    this.fieldRadius,
    this.borderColor,
    this.minHeight,
    this.icon,
    this.image,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth ?? Get.width * 1,
      height: minHeight ?? Get.height * 0.4,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  )
                : SizedBox(),
            icon != null ? SizedBox(width: 3) : SizedBox(),
            image != null
                ? Container(
                    height: minHeight ?? Get.height * 0.4 - 20,
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 10),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.fitHeight,
                    ))
                : SizedBox(),
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.blue.shade600,
                  fontSize: textSize ?? 12,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  fontFamily: fontFamily ?? 'Helvetica_normal'),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fieldRadius ?? 10),
            side: BorderSide(
              width: 2,
              color: borderColor ?? Colors.blue.shade600,
            ),
          ),
          padding: EdgeInsets.all(1),
        ),
      ),
    );
  }
}
