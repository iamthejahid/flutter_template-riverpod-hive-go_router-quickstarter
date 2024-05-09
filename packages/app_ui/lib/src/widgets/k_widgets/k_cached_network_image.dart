import 'package:app_ui/app_ui.dart';

class KCachedNetworkImageNoBase extends StatelessWidget {
  const KCachedNetworkImageNoBase(
      {Key? key,
      required this.imageUrl,
      this.borderRadius = const BorderRadius.all(Radius.zero),
      this.height = 200,
      this.width = double.infinity,
      this.borderWidth,
      this.fit = BoxFit.cover,
      this.child,
      this.padding,
      this.margin,
      this.borderColor})
      : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          padding: padding,
          margin: margin,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1.w,
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
      },
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: .8.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      // placeholder: (context, url) => const Icon(Icons.error),
    );
  }
}

class KCachedNetworkImageWdLoading extends StatelessWidget {
  const KCachedNetworkImageWdLoading({
    Key? key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.borderWidth,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.borderColor,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // imageUrl: APIRoute.BASE_URL + imageUrl,
      imageUrl: '',
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Hero(
          tag: imageUrl,
          child: Container(
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            padding: padding,
            margin: margin,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1.w,
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          ),
        );
      },
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: .8.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      // placeholder: (context, url) => const Icon(Icons.error),
    );
  }
}

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;

  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? const SizedBox.expand()
        : CachedNetworkImage(
            // imageUrl: "${APIRoute.BASE_URL}$imageUrl",
            imageUrl: '',
            fit: fit,
            height: height,
            width: width,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            // placeholder: (context, url) => const Icon(Icons.error),
          );
  }
}
