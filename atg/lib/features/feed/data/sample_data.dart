import '../models/Post_model.dart';

final List<PostModel> testPosts = [
  PostModel(
    id: '1',
    username: 'Naveen',
    UserImage: 'assets/images/profile.PNG',
    postContent:
        'Today I want to share something meaningful with everyone here. '
        'Life has been teaching me many lessons lately, especially about patience, '
        'growth, and consistency. Every small step we take daily matters more than '
        'we realize. Even when progress feels slow, showing up every day builds '
        'strength over time. Surround yourself with positive people, learn from '
        'mistakes, and never be afraid to start again. Success is not about being '
        'perfect, it is about being persistent. Keep learning, keep improving, '
        'and trust the process. Your journey is unique, and every experience adds '
        'value to who you are becoming.',
    postImage: 'assets/images/digi.jpg',
    likes: 12,
    comment: [],
  ),

  PostModel(
    id: '2',
    username: 'Pawan',
    UserImage: 'assets/images/profile1.jpeg',
    postContent:
        'This view reminded me why taking breaks is so important in our busy lives. '
        'Sometimes we get so focused on work and responsibilities that we forget '
        'to pause and appreciate the beauty around us. Natu.',
    postImage: 'assets/images/pos5.PNG',
    likes: 45,
    comment: [],
  ),
];
