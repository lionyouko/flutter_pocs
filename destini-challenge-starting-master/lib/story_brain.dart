// Step 6 - import the story.dart file into this file.
import 'package:destini_challenge_starting/pair.dart';
import 'package:destini_challenge_starting/story.dart';

// Step 5 - Create a new class called StoryBrain.
class StoryBrain {
  //: Step 16 - Create a property called storyNumber which starts with a value of 0. This will be used to track which story the user is currently viewing.
  int _storyNumber = 0;

  // Step 7 - Uncomment the lines below to include storyData as a private property in StoryBrain. Hint: You might need to change something in story.dart to make this work.
  late final List<Story> _storyData;

  late final Map<Pair<Story, int>, int> _state;

  StoryBrain() {
    this._storyData = const [
      const Story(
          'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
          'I\'ll hop in. Thanks for the help!',
          'Better ask him if he\'s a murderer first.'),
      const Story(
          'He nods slowly, unphased by the question.',
          'At least he\'s honest. I\'ll climb in.',
          'Wait, I know how to change a tire.'),
      const Story(
          'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
          'I love Elton John! Hand him the cassette tape.',
          'It\'s him or me! You take the knife and stab him.'),
      const Story(
          'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
          'Restart',
          'Menu'),
      const Story(
          'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
          'Restart',
          'Menu'),
      const Story(
          'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
          'Restart',
          'Menu'),
      const Story('Start The Destini', 'Start', '')
    ];

    this._state = {
      Pair(_storyData[0], 1): 2,
      Pair(_storyData[0], 2): 1,
      Pair(_storyData[1], 1): 2,
      Pair(_storyData[1], 2): 3,
      Pair(_storyData[2], 1): 5,
      Pair(_storyData[2], 2): 4,
      Pair(_storyData[3], 1): 0,
      Pair(_storyData[3], 2): 6,
      Pair(_storyData[4], 1): 0,
      Pair(_storyData[4], 2): 6,
      Pair(_storyData[5], 1): 0,
      Pair(_storyData[5], 2): 6,
      Pair(_storyData[6], 1): 0,
      Pair(_storyData[6], 2): 6
    };

    _storyNumber = 0;
  }

//: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//Step 8 - Create a method called getStory() that returns the first storyTitle from _storyData.
  String getStory() {
    return _storyData[_storyNumber].getStory();
  }

//: Step 11 - Create a method called getChoice1() that returns the text for the first choice1 from _storyData.

//: Step 12 - Create a method called getChoice2() that returns the text for the first choice2 from _storyData.
  String getChoice1() {
    return _storyData[_storyNumber].getChoice1();
  }

  String getChoice2() {
    return _storyData[_storyNumber].getChoice2();
  }

  //: Step 17 - Create a method called nextStory(), it should not have any outputs but it should have 1 input called choiceNumber which will be the choice number (int) made by the user.

  //: Step 21 - Using the story plan, update nextStory() to change the storyNumber depending on the choice made by the user. e.g. if choiceNumber was equal to 1 and the storyNumber is 0, the storyNumber should become 2.

  //TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyNumber to 0.

  void nextStory(int choiceNumber) {
    // Very important thing to remember: if we are creqating a new custom object, we must implement the equals and the hashcode.
    // Using a Pair in a map would fail all time as the equality from reference would be the default and Pair was being used as key.
    // a key must eb equal to the other to return true. So we need to define what is true. Just like in Java during University.

    Pair key = Pair(this._storyData[_storyNumber], choiceNumber);
    int? nextState = this._state[key];

    this._storyNumber = nextState!;
  }
}




//: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.


//: Step 20 - Download the story plan here: https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3


//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
