// Step 2 - Create a new class called Story.
class Story {
// Step 3 - Create 3 properties for this class, A. storyTitle to store the story text. B. choice1 to store the text for choice 1, C. choice2 to store the text for choice 2.
  final String _storyTitle;
  final String _choice1;
  final String _choice2;

// Step 4 - Create a Constructor for this class to be able to initialise the properties created in step 3.
  const Story(this._storyTitle, this._choice1, this._choice2);

  String getStory() {
    return this._storyTitle;
  }

  String getChoice1() {
    return this._choice1;
  }

  String getChoice2() {
    return this._choice2;
  }

  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Story &&
        (other._storyTitle == this._storyTitle &&
            other.getChoice1() == this.getChoice1() &&
            other.getChoice2() == this.getChoice2());
  }

  @override
  int get hashCode {
    return this._storyTitle.hashCode +
        this._choice1.hashCode +
        this._choice2.hashCode;
  }
}
