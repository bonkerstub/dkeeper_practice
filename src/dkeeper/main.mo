import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{
  public type Note = { 
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, content: Text) {
    let newNote : Note = {
      title = titleText;
      content = content;
    };

    notes := List.push(newNote, notes);

    Debug.print(debug_show(notes));
  };

  public query func readNotes() : async [Note] {
    return List.toArray(notes)
  };

  public func removeNote(index: Nat) {
    let takeList = List.take(notes, index);
    let dropList = List.drop(notes, index + 1);
    notes := List.append(takeList, dropList);
  }
}