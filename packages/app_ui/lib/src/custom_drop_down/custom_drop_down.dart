import 'package:app_ui/app_ui.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.itemAsString,
    required this.compareFn,
    required this.selectedItem,
    required this.onChanged,
    required this.labelText,
    this.showSearchBox = true,
    this.isRequired = true,
  });

  final List<T> items;
  final String Function(T) itemAsString;
  final bool Function(T, T) compareFn;
  final T selectedItem;
  final void Function(T?)? onChanged;
  final String labelText;
  final bool showSearchBox;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      compareFn: compareFn,
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        showSelectedItems: true,
        showSearchBox: showSearchBox,
        scrollbarProps: ScrollbarProps(
          thumbVisibility: true,
        ),
      ),
      items: items,
      itemAsString: itemAsString,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
        dropdownSearchDecoration: InputDecoration(
          // labelText: labelText,
          hintText: labelText,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                labelText,
                overflow: TextOverflow.ellipsis,
              )),
              if (isRequired)
                Text("*", style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
