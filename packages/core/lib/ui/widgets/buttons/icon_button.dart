import 'package:flutter/material.dart';

import 'package:fastyle_core/fastyle_core.dart';

class FastIconButton extends StatefulWidget implements IFastButton {
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry padding;
  final Alignment iconAlignment;
  final Color? highlightColor;
  final Color? iconColor;
  final double iconSize;
  final String? tooltip;
  final Widget icon;

  @override
  final Duration trottleTimeDuration;

  @override
  final bool shouldTrottleTime;

  @override
  final VoidCallback onTap;

  @override
  final bool isEnabled;

  const FastIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.trottleTimeDuration = kFastTrottleTimeDuration,
    this.emphasis = FastButtonEmphasis.low,
    this.iconAlignment = Alignment.center,
    this.iconSize = kFastIconSizeSmall,
    this.padding = kFastEdgeInsets8,
    this.shouldTrottleTime = false,
    this.isEnabled = true,
    this.highlightColor,
    this.iconColor,
    this.tooltip,
  }) : super(key: key);

  @override
  _FastIconButtonState createState() => _FastIconButtonState();
}

class _FastIconButtonState extends State<FastIconButton>
    with FastThrottleButtonMixin {
  @override
  void dispose() {
    unsubscribeToTrottlerEventsIfNeeded();
    trottler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _color = widget.iconColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color!);

    return IconButton(
      padding: widget.padding,
      onPressed: throttleOnTapIfNeeded(),
      highlightColor: widget.highlightColor,
      icon: Align(alignment: widget.iconAlignment, child: widget.icon),
      iconSize: widget.iconSize,
      disabledColor: _color.withAlpha(kDisabledAlpha),
      color: _color,
      tooltip: widget.tooltip,
    );
  }
}
