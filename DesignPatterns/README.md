
  

  

#  <center> Design Patterns (OO) </center>

  

  

******Start Date:****** January 8th, 2021

  

  

******Author:****** Jonathan Phouminh

  

  

  

##  Description

  

  

This is the directory page for all the design patterns that you might find useful to use in future projects. Patterns are found from previous lecture slides along with "Design Pattern in Swift 5"

  

**Creational Patterns:** These patterns are concerned with the decoupling of creation of objects and their usage. Thus, we don't expose the creation of objects to the users.

  

**Structural Patterns:** These patterns aim to take objects and classes into larger structures and to achieve new functionality.

  

**Behavioral Patterns** These patterns are concerned with how objects exchange information with each other without adding unnecessary dependencies. We are more concerned here about the interaction of different objects in our system.

  
  

**Where you left off:** You are in the process of implementing the Factory pattern and Abstract Factory
  

  

##  Implemented Patterns

<u>**Creational Patterns**</u>

* Singleton Pattern
	* Use it when you want to make sure that only one instance of this object is created. Like having a data handler, you shouldn't really need more than one. Have to be careful because this pattern gets dangerous in multi-threaded applications

<u>**Structural Patterns**</u>
* Decorator
	* Allows you to assign properties to object dynamically. Use this for when you have something like the a drink that has many condiments / add ons. 
  

**<u>Behavioral Patterns</U>**

* Observer
	*  decouples objects interactions. Allows multiple objects to subscribe to an observable. For any object that is no longer needed to listen to the observable you must make sure you unsubscribe or else ARC will fail. In reality, what you are going to want to use is the Notification Center because its a lot easier to work with than manually creating one.

  

  

##  Patterns to Implement

**Creational Patterns**

* Prototype

* Builder

  

**Structural Patterns**

* Adapter

* Facade

* Flyweight

* Proxy
* Strategy
  

**Behavioral Patterns**

* Decorator

* Factory

* Strategy