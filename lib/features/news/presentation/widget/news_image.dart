import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.preloadNext = true,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final bool preloadNext;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return _buildPlaceholder();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
      fadeInDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Icon(Icons.error_outline),
    );
  }
}
