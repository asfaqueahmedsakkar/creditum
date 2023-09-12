import 'package:creditum/app/core/components/input_container.dart';
import 'package:creditum/app/core/components/selectable_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownArea<T> extends StatelessWidget {
  final String? label;
  final String? error;
  final String? hint;
  final bool? enabled;
  final T? selectedItem;
  final Function(T) onItemPick;
  final String Function(T)? itemName;
  final dynamic Function(T)? itemId;

  final List<T> items;

  const DropdownArea({
    Key? key,
    this.label,
    this.error,
    this.hint,
    this.enabled,
    this.selectedItem,
    required this.onItemPick,
    this.itemName,
    this.itemId,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Get.bottomSheet(
          Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: Center(
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 8),
                    height: 36,
                    width: 36,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                label != null ? "Select $label" : (hint ?? "Select item"),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) => SelectableItem(
                onTap: (){
                  Get.back();
                  onItemPick(items[index]);
                },
                title: itemName == null
                    ? items[index].toString()
                    : itemName!(items[index]),
                isSelected: getIndex(selectedItem) == getIndex(items[index]),
              ),
              itemCount: items.length,
            ),
          ),
        );
      },
      child: InputContainer(
        label: label,
        error: error,
        disablePadding: true,
        enabled: enabled ?? true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  getTextContent(),
                  style: getTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: enabled != false ? Colors.black : Colors.grey[300],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getTextStyle() {
    TextStyle style = const TextStyle(
      fontSize: 16,
      letterSpacing: 0.2,
    );
    if (selectedItem == null) style = style.copyWith(color: Colors.grey[300]);
    return style;
  }

  String getTextContent() {
    if (selectedItem != null && itemName != null) {
      return itemName!(selectedItem as T);
    }
    return selectedItem?.toString() ?? hint ?? "";
  }

  getIndex(T? selectedItem) {
    return selectedItem == null
        ? null
        : itemId == null
            ? selectedItem.toString()
            : itemId!(selectedItem);
  }
}
