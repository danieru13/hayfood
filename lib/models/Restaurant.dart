class Restaurant{  
  late String name;
  late String address;
  late String phone;
  late String open;
  late String image;
  late String rating;
  late String description;
  Restaurant(name,description,address,phone,rating,open,image){
    this.name = name;
    this.description = description;
    this.address = address;
    this.phone = phone;
    this.rating = rating;
    this.open = open;
    this.image = image;
  }
}