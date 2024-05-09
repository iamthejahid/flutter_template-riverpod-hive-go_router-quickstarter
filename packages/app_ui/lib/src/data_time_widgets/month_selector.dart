import 'package:app_ui/app_ui.dart';
import 'package:intl/intl.dart';

class MonthSelector extends StatefulWidget {
  final Function(DateTime selectedMonth) onMonthSelect;
  final bool isDisabled;

  const MonthSelector(
      {Key? key, required this.onMonthSelect, required this.isDisabled})
      : super(key: key);

  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late DateTime selectedMonth;

  @override
  void initState() {
    super.initState();
    selectedMonth = DateTime.now();
    init();
  }

  init() async {
    Future.microtask(() {
      widget.onMonthSelect(selectedMonth);
    });
  }

  void _moveMonth(int increment) {
    if (widget.isDisabled) return;
    setState(() {
      selectedMonth =
          DateTime(selectedMonth.year, selectedMonth.month + increment, 1);
    });
    widget.onMonthSelect(selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.m3SysDarkInverseSurface,
        border: Border(
          bottom: BorderSide(
            color: Colors.blueGrey[600]!,
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 12),
              _buildArrowButton(Icons.arrow_back, () => _moveMonth(-1)),
              Spacer(),
              Column(
                children: [
                  Text(
                    "Month",
                    style: AppTextStyle.m3BodySmall.copyWith(
                      color: AppColors.m3SysLightOnSurfaceVariant,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMM().format(selectedMonth),
                    style: AppTextStyle.m3BodyLarge.copyWith(
                      color: AppColors.m3SysLightOnSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Spacer(),
              _buildArrowButton(Icons.arrow_forward, () => _moveMonth(1)),
              SizedBox(width: 12),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
