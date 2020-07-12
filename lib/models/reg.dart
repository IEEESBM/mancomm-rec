class RegForm {
  String name;
  String regNo;
  String pNo;
  String email;
  String linkToProj;
  int streamIndex;
  List<int> domainIndices;

  RegForm(
      {this.name,
      this.regNo,
      this.pNo,
      this.email,
      this.linkToProj,
      this.streamIndex,
      this.domainIndices});
  
  @override
  String toString() {
    return '{ ${this.regNo}: ${this.name}: ${this.pNo}: ${this.email}: ${this.streamIndex}: ${this.streamIndex}: ${this.domainIndices}}';
  }
}
