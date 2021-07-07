class DashboardCategory {
  final String name;
  final String image;

  DashboardCategory(this.name, this.image);
}

List<DashboardCategory> categoriesDash = categoriesDataDashboard
    .map((item) => DashboardCategory(item['name'], item['image']))
    .toList();

var categoriesDataDashboard = [
  {"name": "Operating Systems", 'image': "images/OS.jfif"},
  {"name": "AWS", 'image': "images/AWS.jfif"},
];
