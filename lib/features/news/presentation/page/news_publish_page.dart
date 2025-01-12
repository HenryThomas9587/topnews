import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:topnews/core/router/router_extension.dart';
import 'package:topnews/core/theme/app_theme.dart';
import 'package:topnews/core/util/logger.dart';
import 'package:topnews/core/widget/app_button.dart';
import 'package:topnews/features/news/domain/entity/news_draft_entity.dart';
import 'package:topnews/features/news/presentation/provider/news_publish_provider.dart'; // Import the provider

class NewsPublishPage extends HookConsumerWidget {
  const NewsPublishPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publishState = ref.watch(newsPublishNotifierProvider);
    final controller = useMemoized(() => QuillController.basic());
    final editorFocusNode = useFocusNode();
    final scrollController = useScrollController();
    final titleController = useTextEditingController();
    final selectedImages = useState<List<String>>([]);
    final selectedCategory = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('发布文章'),
        actions: [
          TextButton(
            onPressed: () => context.pushNewsDraft(
                ref.read(newsPublishNotifierProvider.notifier).draftId ?? ''),
            child: const Text('预览'),
          ),
          TextButton(
            onPressed: () => _handleSaveDraft(
              context,
              titleController.text,
              controller.document.toPlainText(),
              selectedImages.value,
              selectedCategory.value,
              ref,
            ),
            child: const Text('保存草稿'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleInput(titleController),
            const SizedBox(height: AppTheme.spaceMd),
            _buildCategoryDropdown(selectedCategory),
            const SizedBox(height: AppTheme.spaceMd),
            _buildImageUploadSection(
              context,
              selectedImages,
              (selectedImages) => _pickImage(context, selectedImages),
              (selectedImages, index) => _removeImage(selectedImages, index),
            ),
            QuillToolbar(
              child: QuillSimpleToolbar(
                controller: controller,
                configurations: const QuillSimpleToolbarConfigurations(
                  showAlignmentButtons: true,
                  showBackgroundColorButton: true,
                  showBoldButton: true,
                  showCenterAlignment: true,
                ),
              ),
            ),
            _buildRichTextEditor(controller, editorFocusNode, scrollController),
            const SizedBox(height: AppTheme.spaceLg),
            _buildPublishButton(
              context,
              titleController.text,
              controller.document.toPlainText(),
              selectedImages.value,
              selectedCategory.value,
              ref,
              publishState is AsyncLoading, // Use provider's state for loading
            ),
          ],
        ),
      ),
    );
  }

  // 标题输入框
  Widget _buildTitleInput(TextEditingController titleController) {
    return TextField(
      controller: titleController,
      decoration: const InputDecoration(
        hintText: '请输入标题',
        border: OutlineInputBorder(),
      ),
      maxLines: 2,
    );
  }

  // 分类选择下拉框
  Widget _buildCategoryDropdown(ValueNotifier<String?> selectedCategory) {
    return DropdownButtonFormField<String>(
      value: selectedCategory.value,
      decoration: const InputDecoration(
        labelText: '选择分类',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(value: 'tech', child: Text('科技')),
        DropdownMenuItem(value: 'sports', child: Text('体育')),
        DropdownMenuItem(value: 'entertainment', child: Text('娱乐')),
        DropdownMenuItem(value: 'finance', child: Text('财经')),
      ],
      onChanged: (value) => selectedCategory.value = value,
    );
  }

  // 图片上传区域
  Widget _buildImageUploadSection(
    BuildContext context,
    ValueNotifier<List<String>> selectedImages,
    Future<void> Function(ValueNotifier<List<String>> selectedImages)
        pickImageCallback,
    void Function(ValueNotifier<List<String>> selectedImages, int index)
        removeImageCallback,
  ) {
    if (selectedImages.value.isNotEmpty) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: selectedImages.value.length + 1,
          itemBuilder: (context, index) => _buildImageItem(
            context,
            selectedImages,
            index,
            pickImageCallback,
            removeImageCallback,
          ),
          // Consider adjusting cacheExtent if needed
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: () => pickImageCallback(selectedImages),
      icon: const Icon(Icons.add_photo_alternate),
      label: const Text('添加图片'),
    );
  }

  // 单个图片项
  Widget _buildImageItem(
    BuildContext context,
    ValueNotifier<List<String>> selectedImages,
    int index,
    Future<void> Function(ValueNotifier<List<String>> selectedImages)
        pickImageCallback,
    void Function(ValueNotifier<List<String>> selectedImages, int index)
        removeImageCallback,
  ) {
    if (index == selectedImages.value.length) {
      return IconButton(
        onPressed: () => pickImageCallback(selectedImages),
        icon: const Icon(Icons.add_photo_alternate),
      );
    }
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.file(
            File(selectedImages.value[index]),
            // Add cacheWidth and cacheHeight if the display size is fixed
            // cacheWidth: 92,
            // cacheHeight: 92,
            height: 92,
            width: 92,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => removeImageCallback(selectedImages, index),
          ),
        ),
      ],
    );
  }

  // 富文本编辑器
  Widget _buildRichTextEditor(QuillController controller,
      FocusNode editorFocusNode, ScrollController scrollController) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: QuillEditor(
        controller: controller,
        focusNode: editorFocusNode,
        scrollController: scrollController,
        configurations: const QuillEditorConfigurations(),
      ),
    );
  }

  // 发布按钮
  Widget _buildPublishButton(
    BuildContext context,
    String title,
    String content,
    List<String> images,
    String? category,
    WidgetRef ref,
    bool isLoading,
  ) {
    return SizedBox(
      height: 48,
      child: AppButton(
        isChecked: isLoading,
        text: '发布文章',
        checkedText: '发布中...',
        onTap: () =>
            _handlePublishNews(context, title, content, images, category, ref),
      ),
    );
  }

  // 图片选择逻辑 (now passed as a callback)
  Future<void> _pickImage(
      BuildContext context, ValueNotifier<List<String>> selectedImages) async {
    final imagePicker = ImagePicker();
    try {
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImages.value = [...selectedImages.value, image.path];
      }
    } catch (e) {
      logError('选择图片失败: $e');
      if (context.mounted) {
        _showSnackBar(context, '选择图片失败');
      }
    }
  }

  // 删除图片逻辑 (now passed as a callback)
  void _removeImage(ValueNotifier<List<String>> selectedImages, int index) {
    selectedImages.value = [
      ...selectedImages.value.sublist(0, index),
      ...selectedImages.value.sublist(index + 1),
    ];
  }

  // 检查标题和内容是否为空
  bool _validateInputs(BuildContext context, String title, String content) {
    if (title.isEmpty) {
      _showSnackBar(context, '请输入标题');
      return false;
    }
    if (content.isEmpty) {
      _showSnackBar(context, '请输入内容');
      return false;
    }
    return true;
  }

  // 保存草稿逻辑
  Future<void> _handleSaveDraft(
    BuildContext context,
    String title,
    String content,
    List<String> images,
    String? category,
    WidgetRef ref,
  ) async {
    if (!_validateInputs(context, title, content)) {
      return;
    }
    final draft = NewsDraftEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      images: images,
      category: category ?? '',
      createdAt: DateTime.now(),
      isDraft: true,
    );
    logDebug('保存草稿: $draft');
    await ref.read(newsPublishNotifierProvider.notifier).saveDraft(draft);
  }

  // 发布文章逻辑
  Future<void> _handlePublishNews(
    BuildContext context,
    String title,
    String content,
    List<String> images,
    String? category,
    WidgetRef ref,
  ) async {
    if (!_validateInputs(context, title, content)) {
      return;
    }
    final draft = NewsDraftEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      images: images,
      category: category ?? '',
      createdAt: DateTime.now(),
      isDraft: false,
    );
    logDebug('发布文章: $draft');
    final result =
        await ref.read(newsPublishNotifierProvider.notifier).publishNews(draft);
    if (context.mounted) {
      if (result) {
        Navigator.of(context).pop();
      } else {
        _showSnackBar(context, '发布文章失败，请稍后重试');
      }
    }
  }

  // 显示提示信息
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
