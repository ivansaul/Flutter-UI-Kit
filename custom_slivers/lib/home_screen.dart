import 'package:custom_slivers/data/players.dart';
import 'package:custom_slivers/widgets/player_info_widget.dart';
import 'package:custom_slivers/widgets/player_stats_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final player = messi;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: _HeaderDelegate(player: player),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                  ),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

const double _minHeaderExtent = 80;
const double _maxHeaderExtent = 420;

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final FootballPlayer player;
  _HeaderDelegate({
    required this.player,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / _maxHeaderExtent;
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.white,
          ),
          (percent < 0.8)
              ? Positioned(
                  top: 50 - shrinkOffset * 0.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${player.jerseyNumber}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45,
                                    color: Colors.black54,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(player.playerPhoto),
                                  backgroundColor: Colors.grey.shade400,
                                ),
                              ],
                            ),
                            Text(
                              player.firstName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 33,
                              ),
                            ),
                            Text(
                              player.lastName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            PlayerInfoWidget(player: player),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width,
                        child: PlayerStatsWidget(player: player),
                      )
                    ],
                  ),
                )
              : Positioned(
                  top: 10,
                  child: Text(
                    player.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
          DefaultTabController(
            length: 5,
            child: Container(
              color: Colors.white,
              child: const TabBar(
                isScrollable: true,
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.redAccent,
                labelPadding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  top: 10,
                ),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                tabs: [
                  Text('NEWS'),
                  Text('SUMMARY'),
                  Text('CAREER'),
                  Text('MATCHES'),
                  Text('GOALS'),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_rounded),
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
