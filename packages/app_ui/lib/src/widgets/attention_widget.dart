import 'package:app_ui/app_ui.dart';

class AttentionWidget extends StatelessWidget {
  const AttentionWidget({
    Key? key,
    required this.attentionType,
    required this.attentionMessage,
  }) : super(key: key);

  final AttentionType attentionType;
  final String attentionMessage;

  Color get color => attentionType == AttentionType.wrong
      ? AppColors.m3SysLightError
      : AppColors.primaryColor;

  Color get containerColor => attentionType == AttentionType.wrong
      ? AppColors.m3SysDarkOnErrorContainer
      : AppColors.m3RefPrimaryPrimary92;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First part
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          width: 4.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.w),
              bottomLeft: Radius.circular(4.w),
            ),
          ),
          // Sorry for this kinda bangla code!
          child: Text(""),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.w),
                bottomRight: Radius.circular(4.w),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: color,
                ),
                SizedBox(width: 12.w),
                Text(
                  attentionMessage,
                  style: ContentTextStyle.textStyle12w600Secondary.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum AttentionType { wrong, successfull }
