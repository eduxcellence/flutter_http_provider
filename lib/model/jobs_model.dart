/// id : "f008bcac-872d-42b0-aec2-066949cac1c3"
/// type : "Full Time"
/// url : "https://jobs.github.com/positions/f008bcac-872d-42b0-aec2-066949cac1c3"
/// created_at : "Sun Jan 31 14:53:15 UTC 2021"
/// company : "Promaton"
/// company_url : "https://www.promaton.com/"
/// location : "Amsterdam/Remote (UTC-1 to UTC+3)"
/// title : "Senior Backend/Infra Engineer (Rust/Python/AWS/K8S)"
/// description : "<p>Your technical expertise helps us bring our advanced deep learning algorithms to every dental practice in the world so we can increase the quality of healthcare globally. Using micro services on Kubernetes and AWS you make sure our algorithms perform well, and our data is securely transported across our platform</p>\n<p>Promaton is changing dental healthcare by automating diagnostics and treatment workflows using AI, making healthcare more affordable and accessible for everyone. Did you know dentists miss up to 30% of pathologies on an X-Ray? We are on a mission to eliminate errors in dentistry by improving diagnostic accuracy, and automating mundane work like creating 3D models by hand from an X-Ray. See our company page to learn more about what we do.</p>\n<p>You'll be:</p>\n<ul>\n<li>Helping us scale our applications and infrastructure 125x what it can handle now, while making it faster and more robust.</li>\n<li>Working on our Medical AI Tool suite like our Data lake and our globally deployed annotation application, such that we can increase our development velocity, and product quality.</li>\n<li>Constantly improving our CI/CD, so we can ensure the quality of our product</li>\n</ul>\n<p>There are two factors that make the above especially challenging:</p>\n<ol>\n<li>We work with large files, and resource heavy workloads, meaning that we have to invest a lot in optimisation and cost control.</li>\n<li>We are a medical software manufacturer, meaning we comply with the highest standards of software development. This means we have an extensive CI/CD process that has to assure that our AI performs as it should on a wide variety of cases.</li>\n</ol>\n<p>The perks:\n💰  Excellent employment terms\n🏡  Freedom to work from anywhere you like (and any time you like). We only have a few touch points. Not just because of Covid, we are a remote company by design, and have people working from all over Europe.\n👩‍🔬 Dedicated time for hackathons and research, to explore new ideas of your own\n🎓 Real training budget for books and conferences or anything else you need to grow.\n🚀 Work with the latest technology, on the front-end of a rapidly changing field in medical\n💪 Loads of responsibility and autonomy, zero bureaucracy and a chance to make a real impact\n🏖 Awesome yearly company retreat, and quarterly team events.\n⛺️ 25 days of annual leave\n💻 Top-notch gear, and even bigger servers to play with\n🏄‍♂️ Promaton is funded for many years to come, meaning you can have the impact you only get at a startup, but with the job security of an established company.\n🛬 For all international hackers: Promaton is recognized as a visa sponsor by the Dutch government</p>\n<p>Our tech stack:</p>\n<ul>\n<li>Kubernetes on AWS (with EKS)</li>\n<li>Applications mostly written in Typescript. For resource intensive workloads, we are now also developing some tools and applications in Rust.</li>\n<li>AI Pipelines written in Python using Pytorch and Tensorflow</li>\n</ul>\n<p>Job requirements</p>\n<ul>\n<li>Computer science level degree or equivalent</li>\n<li>Programmer by heart, preferably in any of these languages: Rust, Python, Go, JavaScript, Java, C#</li>\n<li>5 years experience building back-end services</li>\n<li>2+ years with Kubernetes and cloud computing (AWS, GCP or Azure)</li>\n<li>Your mindset: open-minded, innovative, detail-oriented</li>\n<li>Based in a time zone between UTC-1 and UTC+3 (-2 to +2 hours Amsterdam time)</li>\n<li>Ability to fly in for company events 4 times a year (1 week per quarter)</li>\n</ul>\n<p>Bonus points:</p>\n<p>Passion for machine learning\nPrevious experience in a regulated environment</p>\n"
/// how_to_apply : "<p>Apply via <a href=\"https://careers.promaton.com/o/senior-backendinfra-engineer\">https://careers.promaton.com/o/senior-backendinfra-engineer</a></p>\n"
/// company_logo : "https://jobs.github.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBbU9YIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7992d89b5293b65437e94fb244b1db3fd092da7c/2018-12-14%20asset-03%20logo-text-fc-bg%20square.png"

class JobsModel {
  String _id;
  String _type;
  String _url;
  String _createdAt;
  String _company;
  String _companyUrl;
  String _location;
  String _title;
  String _description;
  String _howToApply;
  String _companyLogo;

  String get id => _id;
  String get type => _type;
  String get url => _url;
  String get createdAt => _createdAt;
  String get company => _company;
  String get companyUrl => _companyUrl;
  String get location => _location;
  String get title => _title;
  String get description => _description;
  String get howToApply => _howToApply;
  String get companyLogo => _companyLogo;

  JobsModel({
      String id, 
      String type, 
      String url, 
      String createdAt, 
      String company, 
      String companyUrl, 
      String location, 
      String title, 
      String description, 
      String howToApply, 
      String companyLogo}){
    _id = id;
    _type = type;
    _url = url;
    _createdAt = createdAt;
    _company = company;
    _companyUrl = companyUrl;
    _location = location;
    _title = title;
    _description = description;
    _howToApply = howToApply;
    _companyLogo = companyLogo;
}

  JobsModel.fromJson(dynamic json) {
    _id = json["id"];
    _type = json["type"];
    _url = json["url"];
    _createdAt = json["created_at"];
    _company = json["company"];
    _companyUrl = json["company_url"];
    _location = json["location"];
    _title = json["title"];
    _description = json["description"];
    _howToApply = json["how_to_apply"];
    _companyLogo = json["company_logo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["type"] = _type;
    map["url"] = _url;
    map["created_at"] = _createdAt;
    map["company"] = _company;
    map["company_url"] = _companyUrl;
    map["location"] = _location;
    map["title"] = _title;
    map["description"] = _description;
    map["how_to_apply"] = _howToApply;
    map["company_logo"] = _companyLogo;
    return map;
  }

}