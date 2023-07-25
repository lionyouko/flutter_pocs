# flutter_application_educational_resources_poc

For Educational Resources, we would like to display Oral Health Information for the user. For this PoC, we want to get the information from an exterior service, as it could be the case to maintain users updated over time. 

There are many ways to make this: Setting up a small server with REST API endpoints (for example, in Flask with Python), or using online services to mock API calls (as Beeceptor, Postman Mock Server, Mocky, Mock API, among others). 

Because it is more of interest the resulting aspect, it is indifferent the methodology. So, for this PoC, two mocks’ endpoints were created for two different types of use cases: 
In the first use case, an endpoint brings a list of educational resources (Title + Content) to be displayed as a list that can be then accessed and checked as read, which will, trigger rewarding points. In the second use case, the other endpoint brings just one educational resource that will trigger a notification in the PoC app, then the user clicks and will be able to read as soon as app is open.  

The building blocks for this PoC are network communication, widgets that presents lists, clickable list items, a small gamification model, to make a notification on receiving message from network, to open a specific page on clicking local notification, and the traditional navigation list/detail view for smaller screen devices. 

This poc may not have any Flutter architecture pattern lib, however it is a small good example to be reimplemented with such.

