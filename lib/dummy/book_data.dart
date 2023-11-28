







import 'package:podsriver/models/book.dart';

List<Book> bookDataFromJson = bookData.map((e) => Book.fromJson(e)).toList();

const bookData = [
  {
    'title': 'Chariots of the Gods',
    'image': 'https://upload.wikimedia.org/wikipedia/en/2/29/Chariots_Of_The_Gods.jpg',
    'detail': 'Chariots of the Gods? Unsolved Mysteries of the Past is a book written in 1968 by Erich von Däniken and translated from the original German by Michael Heron. It involves the hypothesis',
    'rating': '⭐⭐⭐⭐⭐',
    'genre': 'Sci-fic'
  },
  {
    'title': 'Chariots of the Gods',
    'image': 'https://upload.wikimedia.org/wikipedia/en/2/29/Chariots_Of_The_Gods.jpg',
    'detail': 'Chariots of the Gods? Unsolved Mysteries of the Past is a book written in 1968 by Erich von Däniken and translated from the original German by Michael Heron. It involves the hypothesis',
    'rating': '⭐⭐⭐⭐',
    'genre': 'Sci-fic'
  },
  {
    'title': 'Chariots of the Gods',
    'image': 'https://upload.wikimedia.org/wikipedia/en/2/29/Chariots_Of_The_Gods.jpg',
    'detail': 'Chariots of the Gods? Unsolved Mysteries of the Past is a book written in 1968 by Erich von Däniken and translated from the original German by Michael Heron. It involves the hypothesis',
    'rating': '⭐⭐⭐',
    'genre': 'Sci-fic'
  },
];


