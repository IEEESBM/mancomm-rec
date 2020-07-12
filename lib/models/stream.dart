class Stream {
  int val;
  String name;

  Stream({this.val, this.name});

  @override
  String toString() {
    return '{ ${this.val}: ${this.name} }';
  }
}

Stream cse = Stream(val: 0, name: "Computer Science Engineering");
Stream it = Stream(val: 1, name: "Information Technology");
Stream cce = Stream(val: 2, name: 'Computer and Communication Engineering');
Stream ece = Stream(val: 3, name:'Electronics and Communication Engineering');
Stream eee = Stream(val: 4, name: "Electrical and Electronics Engineering");
Stream eie =
    Stream(val: 5, name: 'Electronics and Instrumentation Engineering');
Stream mecha = Stream(val: 6, name: 'Mechatronics Engineering');
Stream mech = Stream(val: 7, name: "Mechanical Engineering");
Stream aero = Stream(val: 8, name: "Aeronautical Engineering");
Stream auto = Stream(val: 9, name: "Automobile Engineering");
Stream bmed = Stream(val: 10, name: "Biomedical Engineering");
Stream btech = Stream(val: 11, name: 'Biotech Engineering');
Stream chem = Stream(val: 12, name: 'Chemical Engineering');
Stream media = Stream(val: 13, name: 'Media Technology');
Stream civil = Stream(val: 14, name: "Civil Engineering");
Stream indus = Stream(val: 15, name: "Industrial & Production");
Stream other = Stream(val: 16, name: "Other");

class AllStreams {
  List<Stream> streams = [];

  AllStreams() {
    streams.add(cse);
    streams.add(it);
    streams.add(cce);
    streams.add(ece);
    streams.add(eee);
    streams.add(eie);
    streams.add(mecha);
    streams.add(mech);
    streams.add(aero);
    streams.add(auto);
    streams.add(bmed);
    streams.add(btech);
    streams.add(chem);
    streams.add(media);
    streams.add(civil);
    streams.add(indus);
    streams.add(other);

    streams.sort((a,b)=>a.name.compareTo(b.name));
  }

}
