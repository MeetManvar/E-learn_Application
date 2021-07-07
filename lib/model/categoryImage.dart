class Category1 {
  // String name;
  final String image;

  Category1(this.image);

  //Category(this.image);
}

List<Category1> category =
    categoriesData.map((item) => Category1(item['image'])).toList();

var categoriesData = [
  {'image': "images/computer_networking.jpg"},
  {'image': "images/OS.jfif"},
  {'image': "images/Python.jfif"},
  {'image': "images/AWS.jfif"},
];
