class Category{
  static String sportId='sports';
  static String musicId='music';
  static String moviesId='movies';

  String id ;
  late String title;
  late String image;
  Category({required this.id,required this.title, required this.image});
  Category.fromId(this.id){
    if(id==sportId){
      title='Sports';
    image='assets/images/sports.png';
    }else if(id==moviesId){
    title='Movies';
    image='assets/images/movies.png';
    }else if(id==musicId){
    title='Music';
    image='assets/images/music.png';
    }
  }
  static List<Category> getCategory(){
    return[
      Category.fromId(sportId),
      Category.fromId(musicId),
      Category.fromId(moviesId),

    ];
}

}