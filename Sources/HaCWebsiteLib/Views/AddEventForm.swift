import HaCTML
import LoggerAPI

// swiftlint:disable line_length

struct AddEventForm: Nodeable {

  var node: Node {
    return Page(
      title: "Add Event",
      content: Fragment(
        El.Div[Attr.className => "AddEventPage__mainContainer"].containing(
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("eventId"),
          El.Input[Attr.id => "eventId", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("title"),
          El.Input[Attr.id => "title", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("startDate"),
          El.Input[Attr.id => "startDate", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("endDate"),
          El.Input[Attr.id => "endDate", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("tagLine"),
          El.Textarea[Attr.id => "tagLine", Attr.className => "AddEventPage__formInput"].containing(),
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("color"),
          El.Input[Attr.id => "color", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("hypeStartDate"),
          El.Input[Attr.id => "hypeStartDate", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("hypeEndDate"),
          El.Input[Attr.id => "hypeEndDate", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("tags"),
          El.Input[Attr.id => "tags", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("websiteURL"),
          El.Input[Attr.id => "websiteURL", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("imageURL"),
          El.Input[Attr.id => "imageURL", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("markdownDescription"),
          El.Textarea[Attr.id => "markdownDescription", Attr.className => "AddEventPage__formInput"].containing(),
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("latitude"),
          El.Input[Attr.id => "latitude", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("longitude"),
          El.Input[Attr.id => "longitude", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("venue"),
          El.Input[ Attr.id => "venue", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("address"),
          El.Input[Attr.id => "address", Attr.className => "AddEventPage__formInput"],
          El.Div[Attr.className => "AddEventPage__inputLabel"].containing("facebookEventID"),
          El.Input[Attr.id => "facebookEventID", Attr.className => "AddEventPage__formInput"],
          El.Button[Attr.onClick => submitFormJS].containing("Submit")
        )
      )
    ).node
  }

  private let submitFormJS = """
    function submitForm() {
    var xhr = new XMLHttpRequest();
    var url = \"/api/add_event\";
    xhr.open(\"POST\", url, true);
    xhr.setRequestHeader(\"Content-Type\", \"application/json\");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
        }
    };

    var data = JSON.stringify(
      {
      \"eventId\": document.getElementById("eventId").value,
      \"title\": document.getElementById("title").value,
      \"startDate\": document.getElementById("startDate").value,
      \"endDate\": document.getElementById("endDate").value,
      \"tagLine\": document.getElementById("tagLine").value,
      \"color\": document.getElementById("color").value,
      \"hypeStartDate\": document.getElementById("hypeStartDate").value,
      \"hypeEndDate\": document.getElementById("hypeEndDate").value,
      \"tags\": [document.getElementById("tags").value],
      \"websiteURL\": document.getElementById("websiteURL").value,
      \"imageURL\": document.getElementById("imageURL").value,
      \"markdownDescription\": document.getElementById("markdownDescription").value,
      \"latitude\": parseFloat(document.getElementById("latitude").value),
      \"longitude\": parseFloat(document.getElementById("longitude").value),
      \"venue\": document.getElementById("venue").value,
      \"address\": document.getElementById("address").value,
      \"facebookEventID\": document.getElementById("facebookEventID").value
      }
    );
    console.log(\"sending\");
    xhr.send(data);
    console.log(\"sent\")
    }; submitForm();
    """
}