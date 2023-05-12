class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      image: 'assets/onboard1.jpg',
      title: 'LEARN',
      discription:
          "Up-to-date information on climatic and atmospheric trends and their impacts "
          "while offering tips, guidance & helping us learn, to make a difference that "
          "matters."),
  OnbordingContent(
      image: 'assets/onboard2.jpg',
      title: 'GROW',
      discription:
          "A comprehensive suite of resources with an easy-to-navigate interface, and "
          "cradle of horticulture opportunities that allow self growth and help keep our "
          "planet clean and green."),
  OnbordingContent(
      image: 'assets/onboard3.jpg',
      title: 'EARN',
      discription:
          "Best time to start learning and being activated about climate change. With the"
          " app, you can earn vouchers and coupons to demonstrate your progress and "
          "understanding of climate change."),
];