ThetaTauApp
===========

Database App using CoreData for fraternity to record their brothers and board members. Also records stats by major and integrates Facebook and Twitter. Password for authorization is username:OT Pass:123

Back End Programming (CoreData and Entities): Ripley Lupine

Front End Programming (User Interface and ViewControllers): David Oramas

Work Completed By Ripley Lupine Include:

1. Core Data Entities

These classes hold attributes that will be stored information of every item in CoreData. 
Also holds methods to convert from UIImage to Transmutable and vice-versa in order to store images.

ChairsEntity.h 
BrothersEntity.h 
EboardEntity.h

ChairsEntity.m 
BrothersEntity.m 
EboardEntity.m 

2.) DataStore for CoreData

This class contains methods to create new entity to save or get an array of entities sorted by the specification 
of a given parameter. It also includes a method for deleting an item from CoreData as well as saving all changes to
CoreData. The DataStore is accessed throughout the project by use of a singleton implementation.

DataStore.h
DataStore.m

3.) Major Analysis Class

This class gets the count of all the entities within CoreData and tallys the numbers of each major currently present
in the database.

OTMajorAnalysisViewController.h
OTMajorAnalysisViewController.m
OTMajorAnalysisViewController.xib

4.) AppDelegate Class

In the AppDelegate Class I Implemented the "sharedContext" and "sharedModel" methods so that the context and model
of CoreData can be passed from the AppDelegate to the DataStore. The variables for the model and context are in
AppDelegate.h.

AppDelegate.h
AppDelegate.m

5.) RushViewController Social Networking Methods

In RushViewController.m I Implemented the Social Framework for iOS and implemented the methods necessary to allow
the user to send posts to Facebook and tweets to Twitter providing that they have set up their social configurations
on their device.

RushViewController.m


