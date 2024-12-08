import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textStyle,
    this.isStadiumBorder = true,
    this.radius,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? StadiumBorder()
              : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          backgroundColor: backgroundColor ?? Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          textStyle: textStyle ?? Theme.of(context).textTheme.titleLarge
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            SizedBox(width: 10),
            Text(label,style: textStyle,),
            if (suffixIcon != null) ...[
              SizedBox(width: 10),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
