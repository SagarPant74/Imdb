# Imdb Clone (Completely Programmatic UI)
IMDB clone

This is a simple IMDB Clone with completely programmatic UI, right from the app, scene delegate. 🚀

This means 
- ❌ Storyboards
- ❌ XIBs

First the screenshots.
|Movie List View| Movie Detail View|
|:-----:|:------:|
|![Simulator Screen Shot - iPhone X - 2021-11-02 at 20 05 50](https://user-images.githubusercontent.com/71034915/139868255-dab918b2-1cde-423b-8f80-d01daa6c67b4.png)|![Simulator Screen Shot - iPhone X - 2021-11-02 at 20 06 02](https://user-images.githubusercontent.com/71034915/139868305-19ebc69a-32cf-4ff0-bf24-4109a8d3876d.png)|

<h2>Architectural Insights</h2>
<h3>MVVM</h3>
Currently the app follows <a href= "https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel">MVVM</a> Architecture.

<img width="498" alt="Screenshot 2021-11-02 at 10 45 57 PM" src="https://user-images.githubusercontent.com/71034915/139913742-1bc999d0-f002-45d9-b852-a60e53df97ad.png">


<h3>Repository Pattern</h3>
Data Repository is used to aggregate data. <a href="https://medium.com/tiendeo-tech/ios-repository-pattern-in-swift-85a8c62bf436">Repository pattern</a> is used to aggregate data from various sources and then merge it to finally provide information to view models.

<h3>Protocol Oriented Programming</h3>
<a href="https://www.raywenderlich.com/6742901-protocol-oriented-programming-tutorial-in-swift-5-1-getting-started">Protocol oriented</a> is a programming paradigm which suggests to write code based on abstraction. Classes, structs enums should implement an protocol/ interface.

<h3>Dependeny Injection</h3>
<a href="https://www.raywenderlich.com/14223279-dependency-injection-tutorial-for-ios-getting-started">Dependency injection</a> is a simple concept that helps in writing decoupled code. The class during its entire lifecyle is unware of the implementation and creation of its dependencies.

Dependency Injection when combined with protocol oriented programming helps in writing decoupled code, which can be easily tested, and makes changing, swapping concrete implementation simpler.


<h2>UI Part</h2>
As stated earlier the project uses programmatic UI right from the start, No XIBs, no story boards.
Views are separated from their data that they display/ Views are driven by their View Datas.

<a href="https://medium.com/dolap-tech/hidden-gems-of-uistackview-3b94a0001d29">Views have been designed with UIStackViews</a>. Stack Views are really powerful tools for constraints based layouts.

<h4>TableView cells</h4>

<img width="400" alt="Screenshot 2021-11-03 at 12 48 58 AM" src="https://user-images.githubusercontent.com/71034915/139930738-b44914d9-6c6c-40c7-803b-9305df6d02b6.png">

<h4>RatingPopularity View</h4>

<img width="214" alt="Screenshot 2021-11-03 at 12 49 45 AM" src="https://user-images.githubusercontent.com/71034915/139930782-d62d2431-3aa1-4992-92e4-ef3f0f266280.png">

</h4>Title Subtitle View</h4>
<img width="172" alt="Screenshot 2021-11-03 at 12 55 47 AM" src="https://user-images.githubusercontent.com/71034915/139935162-4c017d0d-5511-4447-882d-44183212e26b.png">

This is pure Swift project ❤️ with no external pods and dependencies.

