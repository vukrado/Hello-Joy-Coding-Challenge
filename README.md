# Hello-Joy-Coding-Challenge
Coding challenge for HelloJoy.

To switch between test patients "Jane Doe" & "Frank Smith" go to *AssessmentClient.swift* and change line 18 to use *oneAssessmentURL* or *twoAssessmentURL*.

## Task & Requirements
I was tasked with building a portion of the patient-facing iOS application of HelloJoy which would allow individuals to complete any assessments that have been assigned to them.

- [x] Patients should only be able to view/complete assessments that are assigned to them.
- [x] If a patient is assigned more than one assessment, they should be able to answer all questions back-to-back, as if it was a single combined assessment.
- [x] Questions should be displayed one at a time on a given page/screen
- [x] Each page should display - assessment title, display_name, quesiton title, all answer options, question number
- [x] Tapping on an answer option should automatically advance the user to the next question
- [x] Across all screens, display a progress bar that indidcates where the user is in the overall assessment experience that udpates with each completed question
- [x] Upon answering the final question, simply log/print out the data as you would submit it to the backend POST endpoint 
- [ ] Host it somewhere (TestFlight)


## Problems & Solutions
1. Multiple assessments in one flow
    - I solved this by using some helper methods on Array where the Element was of type Assessment.
    - I use a dictionary mapping the start question and end question to the display name for that assessment allowing me to change the display name depending on the current question, this was especially usefully if the user was to go back in the assessment. Though I do not really like this solution and would like to look at another way of doing this.
2. Saving answer state when user is moving back in the assessment/updates an old answer
    - I solved this by having an array store all of the completed answers and would check the array for the current question and if it exists then I would update the buttons value to show what the user's previous answer was.

## Technical Choices
1. One View Controller for the entire assessment
    - I used when view controller for displaying the entire assessment because I did not want to have to deal with initalizing new view controllers and having to pass information back and forth for each question.
2. Set Answer Button's tags to map the value of that specific answer
    - I set the button's tags to be equal to the value of that specific answer because this allowed for easily initializing new Answer objects and adding them to my list of completed answers for that assessment.
3. Using a list of questions for all the assessments combined instead of going through assessment by assessment
    - This is something i'd like to look back at, but I had a helper method on an Array where the Element was an Assessment and I would return an Array of all the Questions so I wouldn't have to keep track of which assessment was going on and then have to save all of the previous assessments states in case the user were to go back to one of those questions.

## Other

- I would like to change the UI for the assessment, I don't necessairly love how the color gets highlighted then moves on to the next one, sometimes it gets confusing which question you just answered and what your answer was if you are revising old answers to questions.
- I would like to look into using Sets where applicable instead of Arrays for quicker lookup time if I have heterogeneous objects.
- I don't know how exactly the assessment title works when their is multiple assessments, as well as the answers for when their is multiple assessments. I would have to update how the buttons work as well as the title, if the number of potential answers is variable for each assessment then I would like to create a more reusable button and then initialize a stack view with how ever many buttons is needed.
- I would like to write unit tests/ui tests. 
- The current way the graph view works is pretty bad. I would want a reusable view for the graph and then add those to the scroll view. I had a lot of trouble configuring a scroll view in a colleciton view cell. I don't know if the signals home page will only have those for signals, I maybe could have used a table view controller with static cells if that were the case and that could have made it easier.
