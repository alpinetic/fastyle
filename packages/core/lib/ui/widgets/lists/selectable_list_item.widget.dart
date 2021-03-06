import 'package:fastyle_core/fastyle_core.dart';
import 'package:flutter/material.dart';

class FastSelectableListItem<T extends FastItem> extends StatelessWidget {
  final EdgeInsets? contentPadding;

  ///
  /// Allow to convert the label to beginning of sentence case.
  ///
  final bool capitalizeLabelText;
  final String? descriptionText;
  final Color? selectionColor;
  final VoidCallback onTap;
  final String? labelText;
  final Widget? trailing;
  final bool isSelected;
  final Widget? leading;
  final bool isEnabled;
  final bool isDense;
  final T? item;

  FastSelectableListItem({
    Key? key,
    required this.onTap,
    this.capitalizeLabelText = true,
    this.isSelected = false,
    this.isEnabled = true,
    this.isDense = true,
    this.descriptionText,
    this.contentPadding,
    this.selectionColor,
    this.labelText,
    this.trailing,
    this.leading,
    this.item,
  })  : assert(item?.labelText != null || labelText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var _trailing = item?.descriptor?.trailing ?? trailing ?? kFastDoneIcon;

    if (_trailing is Icon) {
      final icon = _trailing;
      _trailing = Icon(
        icon.icon,
        color: selectionColor ?? ThemeHelper.colors.getPrimaryColor(context),
        size: icon.size,
      );
    }

    return FastListItemLayout(
      contentPadding: contentPadding,
      labelText: item?.labelText ?? labelText!,
      descriptionText: item?.descriptionText ?? descriptionText,
      capitalizeLabelText: capitalizeLabelText,
      onTap: onTap,
      leading: item?.descriptor?.leading ?? leading,
      trailing: isSelected ? _trailing : null,
      isEnabled: item?.isEnabled ?? isEnabled,
      isDense: item?.descriptor?.isDense ?? isDense,
    );
  }
}
