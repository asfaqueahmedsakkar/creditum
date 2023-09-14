import 'package:creditum/app/core/components/input_container.dart';
import 'package:creditum/app/core/components/selectable_item.dart';
import 'package:creditum/app/core/components/text_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TagInputArea<T> extends StatelessWidget {
  final List<T> allTags;
  final List<T> selectedTags;
  final Future<T> Function(String name) onNewTag;
  final Function(T) onTagPick;
  final Function(T) removeTag;
  final String Function(T) getItemName;
  final dynamic Function(T) getItemId;
  final String label;
  final String? hint;

  const TagInputArea({
    super.key,
    required this.allTags,
    required this.selectedTags,
    required this.onNewTag,
    required this.onTagPick,
    required this.removeTag,
    required this.label,
    this.hint,
    required this.getItemName,
    required this.getItemId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Get.bottomSheet(
          SearchableAndCreatablePicker<T>(
            allTags: allTags,
            selectedTags: selectedTags,
            onNewTag: onNewTag,
            onTagPick: onTagPick,
            getItemName: getItemName,
            getItemId: getItemId,
            removeTag: removeTag,
            label: label,
          ),
        );
      },
      child: InputContainer(
        disablePadding: true,
        label: label,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                  child: selectedTags.isEmpty
                      ? Text(
                          "PLease select $label",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: Colors.grey[300]),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: selectedTags
                                .map((e) => _selectedTagUI(e))
                                .toList(),
                          ),
                        )),
              const SizedBox(width: 4),
              const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container _selectedTagUI(e) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            " ${getItemName(e)} ",
            style: const TextStyle(height: 1.3),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => removeTag(e),
            child: const Icon(
              FontAwesomeIcons.xmark,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}

class SearchableAndCreatablePicker<T> extends StatefulWidget {
  const SearchableAndCreatablePicker({
    super.key,
    required this.allTags,
    required this.selectedTags,
    required this.onNewTag,
    required this.onTagPick,
    required this.getItemName,
    required this.getItemId,
    required this.label,
    required this.removeTag,
  });

  final List<T> allTags;
  final List<T> selectedTags;
  final Future<T> Function(String name) onNewTag;
  final Function(T) onTagPick;
  final Function(T) removeTag;
  final String Function(T) getItemName;
  final dynamic Function(T) getItemId;
  final String label;

  @override
  State<SearchableAndCreatablePicker<T>> createState() =>
      _SearchableAndCreatablePickerState<T>();
}

class _SearchableAndCreatablePickerState<T>
    extends State<SearchableAndCreatablePicker<T>> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: Column(
        children: [
          AppBar(
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
              "Select ${widget.label}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextArea(
              controller: controller,
              suffix: GestureDetector(
                onTap: () {
                  controller.clear();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    FontAwesomeIcons.xmark,
                    size: 16,
                  ),
                ),
              ),
              hint: "Search ${widget.label}",
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0),
            itemBuilder: (context, index) {
              if (index == widget.allTags.length) {
                return ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, _) {
                      if (value.text.isEmpty ||
                          widget.allTags.any((element) =>
                              widget.getItemName(element) == value.text)) {
                        return const SizedBox();
                      }
                      return SelectableItem(
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          T tag = await widget.onNewTag(value.text);
                          setState(() {
                            widget.allTags.add(tag);
                            widget.selectedTags.add(tag);
                          });
                          controller.clear();
                        },
                        title: value.text,
                        isSelected: false,
                      );
                    });
              }
              return ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (_, value, __) {
                    var tag = widget.allTags[index];
                    if (!widget.getItemId(tag).contains(value.text)) {
                      return const SizedBox();
                    }
                    var selected = widget.selectedTags.any((element) =>
                        widget.getItemId(element) == widget.getItemId(tag));

                    return SelectableItem(
                      onTap: () {
                        setState(() {
                          if (selected) {
                            widget.removeTag(tag);
                          } else {
                            widget.onTagPick(tag);
                          }
                        });
                      },
                      title: widget.getItemName(tag),
                      isSelected: selected,
                    );
                  });
            },
            itemCount: widget.allTags.length + 1,
          ))
        ],
      ),
    );
  }
}
