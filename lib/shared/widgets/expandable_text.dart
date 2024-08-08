import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;

  const ExpandableText({
    super.key,
    required this.text,
    this.style,
    this.maxLines = 3, // Количество строк до сворачивания
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = widget.style ?? theme.textTheme.labelMedium;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            firstChild: Text(
              widget.text,
              style: textTheme,
              maxLines: widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Text(
              widget.text,
              style: textTheme,
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
          if (!isExpanded)
            Text(
              'еще',
              style: textTheme?.copyWith(color: Colors.blue),
            ),
        ],
      ),
    );
  }
}
