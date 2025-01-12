import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';

class PublishState {
  final QuillController controller;
  final FocusNode editorFocusNode;
  final ScrollController scrollController;
  final TextEditingController titleController;
  final ValueNotifier<List<String>> selectedImages;
  final ValueNotifier<String?> selectedCategory;
  final ValueNotifier<bool> isLoading;

  PublishState({
    required this.controller,
    required this.editorFocusNode,
    required this.scrollController,
    required this.titleController,
    required this.selectedImages,
    required this.selectedCategory,
    required this.isLoading,
  });
}
