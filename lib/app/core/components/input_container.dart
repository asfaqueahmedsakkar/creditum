import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  final String? label;
  final String? error;

  final bool enabled;

  final bool disablePadding;

  const InputContainer({
    Key? key,
    required this.child,
    this.label,
    this.error,
    this.enabled = true,
    this.disablePadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0,left: 8),
              child: Text(
                label!,
                style:  TextStyle(fontSize: 11,color: Colors.grey[500]),
              ),
            ),
          AbsorbPointer(
            absorbing: !enabled,
            child: Container(
              padding: disablePadding
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(8),
                border: const Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
                color: enabled?Colors.transparent:Colors.grey[200]
              ),
              constraints: const BoxConstraints(minHeight: 40),
              alignment: Alignment.center,
              child: child,
            ),
          ),
          if (error != null)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  error!,
                  style: const TextStyle(fontSize: 10, color: Colors.red),
                ),
              ),
            )
          else
            const SizedBox(height: 18)
        ],
      ),
    );
  }
}
