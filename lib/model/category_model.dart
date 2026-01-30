class Category {
  final String emoji, name;

  Category({required this.emoji, required this.name});
}

List<Category> categories = [
  Category(
    emoji: 'https://cdn-icons-png.flaticon.com/512/15348/15348730.png',
    name: 'Romance',
  ),
  Category(
    emoji: 'https://static.vecteezy.com/system/resources/previews/068/186/013/non_2x/smiling-emoji-face-laughing-out-loud-expressive-icon-free-png.png',
    name: 'Comedy',
  ),
  Category(
    emoji: 'https://static.vecteezy.com/system/resources/previews/053/292/700/non_2x/smiling-face-with-eyes-emoji-realistic-free-png.png',
    name: 'Horror',
  ),
  Category(
    emoji: 'https://static.vecteezy.com/system/resources/previews/053/292/700/non_2x/smiling-face-with-eyes-emoji-realistic-free-png.png',
    name: 'Drama',
  )
];