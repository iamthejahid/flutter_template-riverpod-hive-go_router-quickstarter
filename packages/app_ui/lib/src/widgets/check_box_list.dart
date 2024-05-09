import 'package:app_ui/app_ui.dart';

class CustomCheckBoxList extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final Function(String? value)? onSelect;

  const CustomCheckBoxList({
    super.key,
    required this.items,
    this.onSelect,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: items
            .map((e) => CustomCheckBoxV2<String>(
                  onChanged: (v) => v == true ? onSelect!(e) : null,
                  checkBoxTitle: e,
                  value: e,
                  isSelected: e == selectedValue,
                ))
            .toList(),
      ),
    );
  }
}

class CustomMultiCheckBoxList extends StatelessWidget {
  final List<String> selectedValues;
  final List<String> items;
  final Function(String? value)? onSelect;

  const CustomMultiCheckBoxList({
    Key? key,
    required this.items,
    this.onSelect,
    required this.selectedValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: items
            .map(
              (e) => CustomCheckBoxV2(
                onChanged: (v) => onSelect!(e),
                checkBoxTitle: e,
                value: e,
                isSelected: selectedValues.contains(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
