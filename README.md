# AlleGit

This is my solution to task no.1 from Allegro assessment test. To build the app I used SwiftUI, which allowed me to quickly sketch out the preliminary design of my application, and display all the important information right from the get go, i.e. name of the repository, short description, what programming language was used to build a given application (if there was any), and number of stars. The cards that display this information are all buttons that, once tapped, move to a detail screen, where the user can access more information by tapping on the button that opens the whole repository in Safari. Once I built the app, I performed a simple refactor into an MVVM model that is a common pattern when designing apps using the SwiftUI framework.

### What assumptions were made when building the app and what could be improved?
1) **Assumption no.1**: The app had to be very simple to use, displaying only the basic information on the main screen (RepositoryListView)
2) **Assumption no.2**: The detail screen should contain all the information from the main screen + a button that would then redirect the user to the repository site in Safari
3) **Assumption no.3**: The app should utilize the MVVM design pattern
4) **Assumption no.4**: No use of external libraries to make the calls to the GitHub API. (built in URLSession.dataTask was more than enough for this)
5) **Improvement no.1**: Design could be a little bit better. The app looks dull, in the sense that it's all white with a black text. Yes, not using a standard list view is definitely a plus, but still, there is room for improvement. What would be cool to see is a custom Navigation Title, where there is Allegro's logo right next to the name of the user (which, in this case, is Allegro :) )
6) **Improvement no.2**: It'd be cool to have the option of exploring repositories of other users of GitHub. The app in its current state is "static".
7) **Improvement no.3**: The detail screen could display more information about a given repository. But, given the structure of the JSON file, I had to limit myself only to the basics (the DetailView file could easily get out of hand for such simple application if I were to include more information), hence the use of Safari to redirect to the actual repo.
8) **Improvement no.4**: Adding a custom logo would make the app much better :).

To run the app, simply open up XCode, and run it in the Simulator.


<br /> <br /> <br />


<img width="211" alt="AlleGit1" src="https://user-images.githubusercontent.com/19962689/148459265-d0a1fab5-cf93-42d2-85ab-21c53c2138a8.png"/> <img width="211" alt="AlleGit2" src="https://user-images.githubusercontent.com/19962689/148459277-7c7d7da0-2a4f-421c-b898-63bd10e4c488.png"/> <img width="211" alt="AlleGit3" src="https://user-images.githubusercontent.com/19962689/148459279-d0c61bea-b104-4783-8f09-8edfba41996a.png">
