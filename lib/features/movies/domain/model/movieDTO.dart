class MovieDTO{
   final int? id;
   final String title;
   final String overview;
   final String image;

   MovieDTO(
    {
      required this.id,
      required this.title,
      required this.overview,
      required this.image
    }
   );

   factory MovieDTO.fromJson(Map<String, dynamic> json) {
      String posterUrl = json["poster_path"] != null
          ? "https://image.tmdb.org/t/p/w500${json["poster_path"]}"
          : "";
      return MovieDTO(
         id: json["id"],
         title: json["original_title"],
         overview: json["overview"],
         image: posterUrl,
      );
   }


   Map<String, dynamic> toMap (){
      return {
         "id": id,
         "title": title,
         "overview": overview,
         "image": image
      };
   }
   factory MovieDTO.fromMap(Map<String, dynamic> map){
     return MovieDTO(
         id: map["id"],
         title: map["title"],
         overview: map["overview"],
         image: map["image"]
     );
   }

}