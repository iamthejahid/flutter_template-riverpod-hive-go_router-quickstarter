import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class KExpansionTile extends StatefulWidget {
  const KExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.controlAffinity,
    this.trailingIcon1,
    this.trailingIcon2,
    this.hasBorder = true,
    this.borderColor,
  })  : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  final Widget? leading;

  final Widget title;

  final Widget? subtitle;

  final ValueChanged<bool>? onExpansionChanged;

  final List<Widget> children;

  final Color? backgroundColor;
  final Color? borderColor;

  final Color? collapsedBackgroundColor;

  final Widget? trailing;
  final Widget? trailingIcon1;
  final Widget? trailingIcon2;

  final bool initiallyExpanded;

  final bool maintainState;

  final EdgeInsetsGeometry? tilePadding;

  final Alignment? expandedAlignment;

  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final EdgeInsetsGeometry? childrenPadding;

  final Color? iconColor;

  final Color? collapsedIconColor;

  final Color? textColor;

  final Color? collapsedTextColor;

  final ListTileControlAffinity? controlAffinity;

  final bool hasBorder;

  @override
  State<KExpansionTile> createState() => _KExpansionTileState();
}

class _KExpansionTileState extends State<KExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context).readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  ListTileControlAffinity _effectiveAffinity(
      ListTileControlAffinity? affinity) {
    switch (affinity ?? ListTileControlAffinity.trailing) {
      case ListTileControlAffinity.leading:
        return ListTileControlAffinity.leading;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        return ListTileControlAffinity.trailing;
    }
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: widget.trailingIcon2 != null && widget.trailingIcon1 != null
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _isExpanded ? widget.trailingIcon2 : widget.trailingIcon1,
            )
          : widget.trailing ?? const Icon(Icons.expand_more),
    );
    // }
  }

  Widget? _buildLeadingIcon(BuildContext context) {
    if (_effectiveAffinity(widget.controlAffinity) !=
        ListTileControlAffinity.leading) return null;
    return _buildIcon(context);
  }

  Widget? _buildTrailingIcon(BuildContext context) {
    if (_effectiveAffinity(widget.controlAffinity) !=
        ListTileControlAffinity.trailing) return null;
    return _buildIcon(context);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    return ClipRRect(
      borderRadius:
          widget.hasBorder ? BorderRadius.circular(12.r) : BorderRadius.zero,
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor.value ??
              expansionTileTheme.backgroundColor ??
              Colors.transparent,
          border: widget.hasBorder
              ? Border.all(
                  color: widget.borderColor ?? Theme.of(context).dividerColor,
                  width: 1.5.w,
                )
              : Border.symmetric(
                  horizontal: BorderSide(
                    color: borderSideColor,
                    width: 2.w,
                  ),
                ),
          borderRadius: widget.hasBorder ? BorderRadius.circular(12.r) : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTileTheme.merge(
              iconColor: _iconColor.value ?? expansionTileTheme.iconColor,
              textColor: _headerColor.value,
              tileColor: _isExpanded ? Theme.of(context).dividerColor : null,
              // dense: true,
              shape: !_isExpanded
                  ? RoundedRectangleBorder(
                      borderRadius: widget.hasBorder
                          ? BorderRadius.circular(12.r)
                          : BorderRadius.zero,
                    )
                  : RoundedRectangleBorder(
                      borderRadius: widget.hasBorder
                          ? BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            )
                          : BorderRadius.zero,
                    ),
              child: ListTile(
                onTap: _handleTap,
                contentPadding:
                    widget.tilePadding ?? expansionTileTheme.tilePadding,
                // leading: ColoredBox(
                //     color: Colors.amber, child: _buildTrailingIcon(context)),
                title: Row(
                  children: [
                    _buildTrailingIcon(context)!,
                    SizedBox(width: 10.w),
                    widget.title,
                  ],
                ),
                subtitle: widget.subtitle,
                trailing: widget.leading ?? _buildLeadingIcon(context),
              ),
            ),
            ClipRect(
              child: Align(
                alignment: widget.expandedAlignment ??
                    expansionTileTheme.expandedAlignment ??
                    Alignment.center,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = widget.collapsedTextColor ??
          expansionTileTheme.collapsedTextColor ??
          theme.textTheme.titleMedium!.color
      ..end = widget.textColor ??
          expansionTileTheme.textColor ??
          colorScheme.primary;
    _iconColorTween
      ..begin = widget.collapsedIconColor ??
          expansionTileTheme.collapsedIconColor ??
          theme.unselectedWidgetColor
      ..end = widget.iconColor ??
          expansionTileTheme.iconColor ??
          colorScheme.primary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor ??
          expansionTileTheme.collapsedBackgroundColor
      ..end = widget.backgroundColor ?? expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final ExpansionTileThemeData expansionTileTheme =
    //     ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Column(
          crossAxisAlignment:
              widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
          children: widget.children,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
