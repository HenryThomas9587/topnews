import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:topnews/features/news/presentation/provider/news_detail_provider.dart';

class NewsDetailPage extends HookConsumerWidget {
  const NewsDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docAsyncValue = ref.watch(getDocProvider(id));
    final focusNode = useMemoized(() => FocusNode(canRequestFocus: false));
    final scrollController = useMemoized(() => ScrollController());
    final controller = useMemoized(() => QuillController.basic()); // 初始化为空文档
    controller.readOnly = true;
    useEffect(() {
      if (docAsyncValue.hasValue) {
        controller.document = docAsyncValue.value!;
      }
      return null;
    }, [docAsyncValue.value]); // 依赖 docAsyncValue.value

    final embedBuilders = kIsWeb
        ? [
            ...FlutterQuillEmbeds.editorWebBuilders(
              imageEmbedConfigurations: QuillEditorImageEmbedConfigurations(
                imageProviderBuilder: (context, imageUrl) {
                  if (imageUrl.startsWith('assets/')) {
                    return AssetImage(imageUrl);
                  }
                  return NetworkImage(imageUrl);
                },
              ),
              videoEmbedConfigurations:
                  const QuillEditorWebVideoEmbedConfigurations(),
            ),
            TimeStampEmbedBuilder(),
          ]
        : [
            ...FlutterQuillEmbeds.editorBuilders(
              imageEmbedConfigurations: QuillEditorImageEmbedConfigurations(
                imageProviderBuilder: (context, imageUrl) {
                  if (imageUrl.startsWith('assets/')) {
                    return AssetImage(imageUrl);
                  }
                  return NetworkImage(imageUrl);
                },
              ),
              videoEmbedConfigurations: QuillEditorVideoEmbedConfigurations(
                customVideoBuilder: (videoUrl, readOnly) {
                  // ... (你的视频加载逻辑)
                  return null;
                },
              ),
            ),
            TimeStampEmbedBuilder(),
          ];

    final quillConfigurations = QuillEditorConfigurations(
      placeholder: '内容加载中...',
      padding: const EdgeInsets.all(16),
      embedBuilders: embedBuilders,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻详情"),
        actions: [
          IconButton(
            icon: const Icon(Icons.output),
            tooltip: 'Print Delta JSON to log',
            onPressed: () {
              // ... (你的打印逻辑)
            },
          ),
        ],
      ),
      body: SafeArea(
        child: docAsyncValue.when(
          data: (_) => Column(
            children: [
              Expanded(
                child: QuillEditor(
                  controller: controller,
                  focusNode: focusNode,
                  scrollController: scrollController,
                  configurations: quillConfigurations,
                ),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('加载新闻失败: $error')),
        ),
      ),
    );
  }
}

class TimeStampEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'timeStamp';

  @override
  String toPlainText(Embed node) {
    try {
      final data = jsonDecode(node.value.data as String) as List<dynamic>;
      if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
        final insert = data[0]['insert'];
        if (insert is String) {
          return insert;
        }
      }
      return '';
    } catch (e) {
      debugPrint('Error decoding timeStamp data: $e');
      return '';
    }
  }

  @override
  Widget build(
    BuildContext context,
    QuillController controller,
    Embed embed,
    bool readOnly,
    bool isFocused,
    TextStyle style,
  ) {
    try {
      final data = jsonDecode(embed.value.data as String) as List<dynamic>;
      if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
        final insert = data[0]['insert'];
        if (insert is String) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.access_time_rounded, size: 16),
              const SizedBox(width: 4),
              Text(insert),
            ],
          );
        }
      }
    } catch (e) {
      debugPrint('Error building timeStamp widget: $e');
      return const Text('[Invalid TimeStamp]');
    }
    return const SizedBox();
  }
}
