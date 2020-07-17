class Local{
  String _id, _name, _description, _schedule;
  int _likes, _favorites;
  double _starts;

  //Constructor
  Local(this._id, this._name, this._description, this._schedule, this._likes,
      this._favorites, this._starts);

  //getters n setters
  double get starts => _starts;

  set starts(double value) {
    _starts = value;
  }

  get favorites => _favorites;

  set favorites(value) {
    _favorites = value;
  }

  int get likes => _likes;

  set likes(int value) {
    _likes = value;
  }

  get schedule => _schedule;

  set schedule(value) {
    _schedule = value;
  }

  get description => _description;

  set description(value) {
    _description = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}