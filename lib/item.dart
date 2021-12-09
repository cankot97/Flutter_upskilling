
class Item {
  final int id;
  final String title;
  final String url;

  Item({required this.id, required this.title, required this.url});
  

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json['id'],
      title: json['title'],
      url: json['url']
    );
  }
}