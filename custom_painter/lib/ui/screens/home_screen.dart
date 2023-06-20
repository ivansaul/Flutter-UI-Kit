import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 80;
    return Scaffold(
      body: Stack(
        children: [
          const HeaderAppbar(),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                // AppBar
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Avatar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://i.imgur.com/X9mRHu9.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marry',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white54,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'China Beijing',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                color: Color(0xffC45CF2),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: imageSize + 20),
                    FollowWidget(counter: 648, title: 'Follow'),
                    Spacer(),
                    FollowWidget(counter: 24, title: 'Bucket'),
                    Spacer(),
                    FollowWidget(counter: 1046, title: 'Followers'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FollowWidget extends StatelessWidget {
  final int counter;
  final String title;
  const FollowWidget({
    super.key,
    required this.counter,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$counter',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
