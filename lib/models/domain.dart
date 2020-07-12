class Domain {
  bool isSelected;
  String name;
  int index;

  Domain({this.isSelected, this.name, this.index});

  @override
  String toString() {
    return '{ ${this.isSelected}: ${this.name} }';
  }
}

Domain coding = Domain(isSelected: false, name: "Coding", index: 0);
Domain elec = Domain(isSelected: false, name: "Electronics", index: 1);
Domain dev = Domain(isSelected: false, name: "Web & App Dev", index: 2);
Domain graphics = Domain(isSelected: false, name: "Graphics", index: 3);
Domain resMl = Domain(isSelected: false, name: "Research & ML", index: 4);
Domain prCon = Domain(isSelected: false, name: "PR & Content", index: 5);

class AllDomains {
  List<Domain> domains = [];

  AllDomains() {
    domains.add(coding);
    domains.add(elec);
    domains.add(dev);
    domains.add(graphics);
    domains.add(resMl);
    domains.add(prCon);

    domains.sort((a,b)=>a.name.compareTo(b.name));
  }

  void clearChoices(){
    for(var domain in domains){
      domain.isSelected = false;
    }
  }

  List<Domain> getSelected() {
    List<Domain> selectedDomains = [];

    for (var domain in domains) {
      if (domain.isSelected) {
        selectedDomains.add(domain);
      }
    }

    return selectedDomains;
  }

  List<int> getSelectedIndices() {
    List<int> selectedIndices = [];

    for (var domain in domains) {
      if (domain.isSelected) {
        selectedIndices.add(domain.index);
      }
    }

    return selectedIndices;
  }

  static bool verifyDomains(List<Domain> selDomains) {
    bool flag = false;

    for (var domain in selDomains) {
      if (domain.index == 0 || domain.index == 1) {
        flag = true;
      }
    }

    return flag;
  }
}
