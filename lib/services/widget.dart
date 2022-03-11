import 'package:flutter/material.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/fonts.dart';

class WidSplash extends StatelessWidget {
  final Key? keys;
  final Widget? child;
  final Function()? onTap;
  final Function()? onLongPress;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color, splash, highlightColor;
  final BorderRadius? radius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final double elevation;
  final double? width, height;

  const WidSplash({
    this.keys,
    this.child,
    this.shadow,
    this.elevation = 0,
    this.onTap,
    this.onLongPress,
    this.margin,
    this.padding,
    this.color,
    this.splash,
    this.highlightColor,
    this.radius,
    this.border,
    this.width,
    this.height,
  }) : super(key: keys);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      decoration:
      BoxDecoration(borderRadius: radius, border: border, boxShadow: shadow
        // color: color,
      ),
      child: Material(
        color: color ?? CNColor.transparent(),
        key: key,
        elevation: elevation,
        borderRadius: radius,
        child: InkWell(
            onLongPress: onLongPress,
            splashColor: splash ?? CNColor.blackCN(o: 0.03),
            highlightColor: highlightColor ?? CNColor.blackCN(o: 0.03),
            onTap: onTap,
            borderRadius: radius,
            child: Container(
                padding: padding ?? const EdgeInsets.all(0), child: child)),
      ),
    );
  }
}

class TextCustom extends StatelessWidget {
  final String? text, font;
  final Color? color;
  final double size, spacing, height;
  final TextDecoration? decoration;
  final TextAlign align;
  final Alignment? contentAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final FontWeight? weight;
  final FontStyle? fontStyle;

  const TextCustom({
    Key? key,
    @required this.text,
    this.color,
    this.size = 16,
    this.decoration,
    this.align = TextAlign.start,
    this.maxLines,
    this.spacing = 0.0,
    this.height = 1.3,
    this.font,
    this.contentAlign,
    this.overflow,
    this.padding,
    this.weight,
    this.fontStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: contentAlign,
      child: Text(
        text.toString(),
        overflow: overflow,
        softWrap: true,
        textAlign: align,
        maxLines: maxLines,
        style: TextStyle(
            color: color ?? CNColor.blackPrimary(),
            fontFamily: font ?? CNFont.poppins,
            height: height,
            fontSize: size.toDouble(),
            fontWeight: weight ?? FontWeight.normal,
            letterSpacing: spacing.toDouble(),
            decoration: decoration,
            fontStyle: fontStyle
        ),
      ),
    );
  }
}

class Wh {
  static appBar(context, {
    Object title = '',
    bool reload = false,
    Color? color,
    Color? textColor,
    double elevation = 0.0,
    bool back = true,
    double spacing = 15.0,
    List<Widget>? actions,
    bool autoLeading = false,
    bool center = true,
    Widget? leading,
    PreferredSizeWidget? bottom,
    Widget? flexibleSpace,
    double? height,
    FontWeight? weight,
  }) {
    Widget? _leading(){
      if(leading != null){
        return leading;
      }else if (back){
        return IconButton(
          onPressed: () {
            if (reload) {
              Navigator.of(context).pop({'edited': true});
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 18,),
          color: textColor ?? CNColor.white(),
        );
      }else{
        return null;
      }
    }

    Widget _appBar() {
      return AppBar(
        iconTheme: const IconThemeData(size: 3),
        actionsIconTheme: const IconThemeData(size: 3),
        centerTitle: center,
        backgroundColor: color ?? CNColor.primaryColor(),
        automaticallyImplyLeading: autoLeading,
        titleSpacing: back ? 0 : 15,
        elevation: elevation.toDouble(),
        leading: _leading(),
        title: title is Widget
            ? title
            : TextCustom(
          text: title.toString(),
          color: textColor ?? CNColor.white(),
          size: 18,
          weight: weight ?? FontWeight.bold,
          font: CNFont.poppins,
        ),
        actions: actions,
        bottom: bottom,
        flexibleSpace: flexibleSpace,
      );
    }

    return height == null
        ? _appBar()
        : PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: _appBar()
    );
  }
}