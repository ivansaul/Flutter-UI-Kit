import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _HeaderDelagate(),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

const double _minImageSize = 50;
const double _maxImageSize = 120;

const double _minHeaderExtent = 100;
const double _maxHeaderExtent = 300;

class _HeaderDelagate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    final currentImageSize = (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);

    final size = MediaQuery.of(context).size;

    const minLeftMarginImage = 20.0;
    final maxLeftMarginImage = size.width * 0.35;

    const minBottomMarginImage = 15.0;
    const maxBottomMarginImage = _maxHeaderExtent * 0.25;

    final double maxLeftMarginText = size.width * 0.4;

    return Container(
      color: Colors.pink,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left:
                (maxLeftMarginImage * (1 - percent)).clamp(minLeftMarginImage, maxLeftMarginImage),
            bottom: (maxBottomMarginImage * (1 - percent))
                .clamp(minBottomMarginImage, maxBottomMarginImage),
            child: Container(
              width: currentImageSize,
              height: currentImageSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: maxLeftMarginText,
            bottom: 25,
            child: const Text(
              'ivansaul',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
