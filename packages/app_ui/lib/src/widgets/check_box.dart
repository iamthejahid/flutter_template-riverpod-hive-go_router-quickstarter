import 'package:app_ui/app_ui.dart';

class CustomCheckBox<T> extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.onSelect,
    required this.checkBoxTitle,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  final Function(T value) onSelect;
  final String checkBoxTitle;
  final T value;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? () {} : () => onSelect(value),
      child: Row(
        children: [
          isSelected
              ? Icon(
                  Icons.check_box_outlined,
                  color: Colors.blue,
                  size: 18,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.black,
                  size: 18,
                ),
          Text(checkBoxTitle, style: AppTextStyle.m3BodyLarge),
        ],
      ),
    );
  }
}

class CustomCheckBoxV2<T> extends StatelessWidget {
  CustomCheckBoxV2({
    Key? key,
    required this.checkBoxTitle,
    required this.value,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  final String checkBoxTitle;
  final T value;
  final bool isSelected;
  final Function(bool? v) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith((states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              MaterialState.selected,
              MaterialState.focused,
              MaterialState.pressed,
            };
            if (states.any(interactiveStates.contains)) {
              return AppColors.primaryColor;
            }
            return Colors.white;
          }),
          value: isSelected,
          onChanged: onChanged,
        ),
        SizedBox(width: 4.w),
        Text(checkBoxTitle, style: AppTextStyle.m3BodyLarge),
      ],
    );
  }
}
