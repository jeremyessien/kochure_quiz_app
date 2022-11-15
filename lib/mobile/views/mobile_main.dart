import '../../app.dart';

class QuizScreen extends ConsumerWidget {
  static const String routeName = 'quiz_screen';
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final no = ref.watch(pageIndexProvider);
    final pageController = ref.watch(pageViewControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Timer
                const TimerCard(),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    text: "Question ${no + 1}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    children: const [
                      TextSpan(
                        text: "/11",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: BrandColors.colorGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      ref
                          .read(pageIndexProvider.notifier)
                          .update((state) => value);
                    },
                    controller: pageController,
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Center(
                        child: QuestionCard(
                          questionIndex: index,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: KochureButton(
                    onTap: () {
                      ref.read(pageViewControllerProvider).jumpToPage(no + 1);
                    },
                    text: 'Next',
                    width: size.width * 0.25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
