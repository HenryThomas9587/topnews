// import 'dart:convert';
// import 'dart:io' as io show Directory, File;

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:topnews/features/news/presentation/provider/news_publish_detail_provider.dart';

// class NewsDetailPage extends HookConsumerWidget {
//   const NewsDetailPage({super.key, required this.id});

//   final String id;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final newsDetail = ref.watch(newsPublishDetailProvider(id));
//     final controller = useMemoized(() => QuillController.basic(), []);
//     final focusNode = useMemoized(() => FocusNode(), []);
//     final scrollController = useMemoized(() => ScrollController(), []);
//     final editorFocusNode = useMemoized(() => FocusNode(), []);
//     final editorScrollController = useMemoized(() => ScrollController(), []);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("新闻详情"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.output),
//             tooltip: 'Print Delta JSON to log',
//             onPressed: () {
//               // TODO: 保存新闻
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildToolbar(ref, context, controller),
//             Expanded(
//               child: QuillEditor(
//                 controller: controller,
//                 focusNode: focusNode,
//                 scrollController: scrollController,
//                 configurations: QuillEditorConfigurations(
//                   placeholder: 'Start writing your notes...',
//                   padding: const EdgeInsets.all(16),
//                   embedBuilders: [
//                     ...FlutterQuillEmbeds.editorBuilders(),
//                     TimeStampEmbedBuilder(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildToolbar(
//       WidgetRef ref, BuildContext context, QuillController controller) {
//     return QuillSimpleToolbar(
//       controller: controller,
//       configurations: QuillSimpleToolbarConfigurations(
//         embedButtons: FlutterQuillEmbeds.toolbarButtons(),
//         showClipboardPaste: true,
//         customButtons: [
//           QuillToolbarCustomButtonOptions(
//             icon: const Icon(Icons.add_alarm_rounded),
//             onPressed: () {
//               controller.document.insert(
//                 controller.selection.extentOffset,
//                 TimeStampEmbed(
//                   DateTime.now().toString(),
//                 ),
//               );

//               controller.updateSelection(
//                 TextSelection.collapsed(
//                   offset: controller.selection.extentOffset + 1,
//                 ),
//                 ChangeSource.local,
//               );
//             },
//           ),
//         ],
//         buttonOptions: QuillSimpleToolbarButtonOptions(
//           base: QuillToolbarBaseButtonOptions(
//             afterButtonPressed: () {
//               final isDesktop = {
//                 TargetPlatform.linux,
//                 TargetPlatform.windows,
//                 TargetPlatform.macOS
//               }.contains(defaultTargetPlatform);
//               if (isDesktop) {
//                 _editorFocusNode.requestFocus();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildToolbarCustomButton(WidgetRef ref, BuildContext context, QuillController controller) {
//     return IconButton(
//       icon: const Icon(Icons.add_alarm_rounded),
//       onPressed: () {
//         controller.document.insert(
//           controller.selection.extentOffset,
//           TimeStampEmbed(
//             DateTime.now().toString(),
//           ),
//         );

//         controller.updateSelection(
//           TextSelection.collapsed(
//             offset: controller.selection.extentOffset + 1,
//           ),
//           ChangeSource.local,
//         );
//       },
//     );
//   }

// }

// class TimeStampEmbed extends Embeddable {
//   const TimeStampEmbed(
//     String value,
//   ) : super(timeStampType, value);

//   static const String timeStampType = 'timeStamp';

//   static TimeStampEmbed fromDocument(Document document) =>
//       TimeStampEmbed(jsonEncode(document.toDelta().toJson()));

//   Document get document => Document.fromJson(jsonDecode(data));
// }

// class TimeStampEmbedBuilder extends EmbedBuilder {
//   @override
//   String get key => 'timeStamp';

//   @override
//   String toPlainText(Embed node) {
//     return node.value.data;
//   }

//   @override
//   Widget build(
//     BuildContext context,
//     QuillController controller,
//     Embed node,
//     bool readOnly,
//     bool inline,
//     TextStyle textStyle,
//   ) {
//     return Row(
//       children: [
//         const Icon(Icons.access_time_rounded),
//         Text(node.value.data as String),
//       ],
//     );
//   }
// }
