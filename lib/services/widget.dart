import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_taksu/services/colors.dart';
import 'package:test_taksu/services/fonts.dart';
import 'package:test_taksu/services/helper.dart';


//Custom container widget
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
        color: color ?? TaksuColor.transparent(),
        key: key,
        elevation: elevation,
        borderRadius: radius,
        child: InkWell(
            onLongPress: onLongPress,
            splashColor: splash ?? TaksuColor.primaryBG(o: 0.03),
            highlightColor: highlightColor ?? TaksuColor.primaryBG(o: 0.03),
            onTap: onTap,
            borderRadius: radius,
            child: Container(
                padding: padding ?? const EdgeInsets.all(0), child: child)),
      ),
    );
  }
}

//Custom text widget
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
    this.size = 15,
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
            color: color ?? TaksuColor.white(),
            fontFamily: font ?? TaksuFont.roboto,
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

class TextInputCustom extends StatefulWidget {
  final Key? keys;
  final String? label, hint, errorText;
  final TextEditingController? controller;
  final TextInputType? type;
  final TextInputAction? action;
  final bool enabled, obscure, showCursor, readOnly;
  final Function()? onTap;
  final Function(String)? submit, change;
  final FocusNode? node;
  final int? length, maxLines;
  final Widget? suffix, prefix, prefixIcon;
  final double space, fontSize;
  final InputBorder? border;
  final TextStyle? hintStyle;
  final Color? backgroundColor, disableColor;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? formatter;

  const TextInputCustom({
    this.keys,
    this.label,
    this.hint,
    this.controller,
    this.type,
    this.space = 10,
    this.fontSize = 16,
    this.readOnly = false,
    this.action,
    this.enabled = true,
    this.showCursor = true,
    this.obscure = false,
    this.submit,
    this.prefix,
    this.suffix,
    this.onTap,
    this.change,
    this.node,
    this.length,
    this.maxLines,
    this.border,
    this.hintStyle,
    this.backgroundColor,
    this.contentPadding,
    this.prefixIcon,
    this.disableColor,
    this.formatter,
    this.errorText
  }) : super(key: keys);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInputCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.space),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.label == null
              ? const SizedBox.shrink()
              : Container(
            child: TextCustom(
              text: widget.label,
              size: 15,
              weight: FontWeight.bold,
            ),
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.enabled
                    ? widget.backgroundColor ?? TaksuColor.primaryCard()
                    : widget.disableColor ?? const Color.fromRGBO(232, 236, 241, 1),
            ),
            // height: 40,
            child: TextField(
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                showCursor: widget.showCursor,
                controller: widget.controller,
                keyboardType: widget.type,
                textInputAction: widget.action,
                enabled: widget.enabled,
                focusNode: widget.node,
                obscureText: widget.obscure,
                onSubmitted: widget.submit,
                style: TextStyle(
                    fontFamily: TaksuFont.roboto,
                    height: 1,
                    fontSize: widget.fontSize,
                    color: TaksuColor.white()
                ),
                maxLines: widget.maxLines ?? 1,
                minLines: 1,
                onChanged: widget.change,
                inputFormatters: widget.formatter ?? [LengthLimitingTextInputFormatter(widget.length)],
                decoration: InputDecoration(
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  isDense: true,
                  suffixIcon: widget.suffix,
                  suffixIconConstraints: const BoxConstraints(maxHeight: 50),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 50),
                  suffixStyle: const TextStyle(),
                  contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: widget.hint,
                  border: widget.border ?? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: TaksuColor.transparent())
                  ),
                  errorText: widget.errorText,
                  errorStyle: TextStyle(
                    fontFamily: TaksuFont.roboto,
                    fontSize: 9,
                  ),
                  hintStyle: widget.hintStyle ?? TextStyle(
                      fontFamily: TaksuFont.roboto,
                      color: const Color.fromRGBO(109, 109, 109, 0.7),
                      fontSize: 12),
                  enabledBorder: widget.border ?? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: TaksuColor.transparent())
                  ),
                  focusedBorder: widget.border ?? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: TaksuColor.transparent())
                  ),
                  disabledBorder: widget.border ?? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: TaksuColor.transparent())
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

class Wh{
  static appBar(context, {
    Object title = '',
    bool reload = false,
    Color? color,
    Color? textColor,
    double elevation = 0.0,
    bool back = false,
    double spacing = 15.0,
    List<Widget>? actions,
    bool autoLeading = false,
    bool center = false,
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
          color: textColor ?? TaksuColor.white(),
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
        backgroundColor: color ?? TaksuColor.primaryBG(),
        automaticallyImplyLeading: autoLeading,
        titleSpacing: back ? 0 : 30,
        elevation: elevation.toDouble(),
        leading: _leading(),
        title: title is Widget
            ? title
            : TextCustom(
          text: title.toString(),
          color: textColor ?? TaksuColor.white(),
          size: 30,
          weight: weight ?? FontWeight.bold,
          font: TaksuFont.roboto,
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

  // dialog(context, child: Widget) -> slide 0.25 (up), slide -0.25 (down)
  static dialog(context, {
    bool dismiss = true,
    double slide = 0,
    bool transparent = false,
    bool forceClose = true,
    MainAxisAlignment? position,
    @required Widget? child,
    Function? then,
    BorderRadius? radius
  }) {
    Future<bool> onWillPop() {
      return Future.value(forceClose);
    }

    return showDialog(
        context: context,
        barrierDismissible: dismiss,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: onWillPop,
            child: ZoomIn(
              child: Column(
                  mainAxisAlignment: position ?? MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MQuery.width(context),
                      margin: const EdgeInsets.all(15),
                      child: ClipRRect(
                        borderRadius: radius ?? BorderRadius.circular(0),
                        child: Material(
                          color: transparent
                              ? TaksuColor.transparent()
                              : TaksuColor.primaryBG(),
                          child: child,
                        ),
                      ),
                    )
                  ]),
            ),
          );
        }).then((res) {
      if (then != null) then(res);
    });
  }
}

class SVGPicture extends StatelessWidget {
  final String image;
  final double? width, height;
  final BoxFit fit;
  final bool networkImage;
  final Color? color;

  const SVGPicture(this.image, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.networkImage = false,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return networkImage ? SvgPicture.network(
      image,
      width: width,
      height: height,
      fit: fit,
      color: color,
    ) : SvgPicture.asset(
      image,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}

//zoom in animated
class ZoomIn extends StatefulWidget {
  final Widget? child;
  final Key? keys;

  const ZoomIn({
    this.keys,
    this.child
  }) : super(key: keys);

  @override
  _ZoomInState createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        key: _scaffoldKey,
        scale: scaleAnimation,
        child: widget.child
    );
  }
}