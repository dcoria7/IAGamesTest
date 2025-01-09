# IAGamesTest

IAGamesApp is an intuitive app with a freetogame list of games, search, game detail, edit and delete actions.

This app was developed with the following  concepts:


* **SwiftUI** 
* **Dependency Injection** : Using Swinject library to manage the possible dependencies like: network, repositories or useCase.
* **MVVM pattern**
* **Coordinator** : The app has 2 roots, the first one is the Splash and the second is Home.
- **Clean Architecture** : 
  - **Presenter** InitView, Home, Detail page, Edit detail page.
  - **Domain** GameModel entity, Use Case
  - **Data Layer** GameModel entity, Use Case
* **Presenter** Repositories, Network, Persisten storage
* **CoreData** : Add, update, remove
* **Solid principles**
* **Async await**
* **KingFisher** : Using kingfisher library to manage remote images and cache

The app has the ability to switch between fetch data from server and reload new data or use the existing one from local storage(CoreData).

Using SPM to manage third party libraries
The app is running under iOS 16.6 in order to run in older devices.

Using Swift 5

##

![screenshot](images/detail.png)



