class tagslist{
  final String tagID;
  final String tagStatus;


  tagslist({
    this.tagID,
    this.tagStatus,
  } ) ;




  static List<tagslist> allTags()
{

  var listoftags = new List<tagslist>();

  listoftags.add(new tagslist(tagID:"A12045",tagStatus: "Active"),);
  listoftags.add(new tagslist(tagID:"B12045",tagStatus: "Active"),);
  listoftags.add(new tagslist(tagID:"C12045",tagStatus: "Active"),);
  listoftags.add(new tagslist(tagID:"D12045",tagStatus: "Active"),);

  return listoftags;
}
}

class activateTag{
  final bool isValid ;
  final String uniqueid ;
  final bool isActive;

  activateTag(this.isValid,this.uniqueid,this.isActive);
}

