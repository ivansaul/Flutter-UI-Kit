import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/data/intro.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  double progress = 0.0;
  final slides = DataTmp.onboardingSlides;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      double partialProgress = 100 / slides.length;
      progress = partialProgress;
      double currentPage = controller.page ?? 0;

      setState(() {
        progress = (1 + currentPage) * partialProgress;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemCount: slides.length,
            itemBuilder: (context, index) {
              final slide = slides[index];
              return SlideWidget(slide: slide);
            },
          ),
          Positioned(
            bottom: 30,
            left: 24,
            child: PageIndicator(
              controller: controller,
              slides: slides,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 24,
            child: ProgressIndicator(
              controller: controller,
              progress: progress,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  final PageController controller;
  final double progress;

  const ProgressIndicator({
    super.key,
    required this.controller,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ProgressWidget(progress: progress),
        IconButton(
          onPressed: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          icon: const FaIcon(
            FontAwesomeIcons.circleChevronRight,
            size: 42,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.controller,
    required this.slides,
  });

  final PageController controller;
  final List<Slide> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: slides.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.white54,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}

class SlideWidget extends StatelessWidget {
  const SlideWidget({
    super.key,
    required this.slide,
  });

  final Slide slide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: slide.backgroundColor,
        ),
        Positioned(
          bottom: 140,
          left: 0,
          right: 0,
          child: Align(
            alignment: slide.alignment,
            child: SvgPicture.asset(slide.imagePath),
          ),
        ),
        Positioned(
          top: 85,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                slide.title,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                slide.subtitle,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
