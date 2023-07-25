# flutter_application_timers_trackers_poc

For timers and trackers, a Timer were built and shown in the scree where the user is prompted to brush its teeth during all time between start and finish. American Dental Association recommends following the 2/2 rule, that is brushing 2 times a day, 2 minutes each. For demonstration purposes, we going to put 5 seconds instead. 

For the Tracker, after one is finished, the tracker will save the finished one and user can check later, a given day/date, how it went in terms of oral hygiene.

Use case example follows like this: 
-	User picks up a day (in gray) from the list being shown in the initial screen. 
-	In the next screen it selects to start one of the two daily brushes that happens to be incomplete. 
-	A Dialog asks if it can be started. Once clicked Ok, it starts for 5 seconds. Once finished, that daily brush is checked. 
-	Back to the initial screen, for that day, its border color will be yellow. 
-	If user brushes again, day will be marked as completed (and green border). 

