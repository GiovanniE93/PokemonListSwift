PokemonListSwift:

Una semplice app iOS sviluppata con UIKit senza l'utilizzo di XIB e Storyboard.

Scelte di sviluppo: ho deeciso di non utilizzare alcun framework esterno perché ho preferito sviluppare interamentee il codice da solo. 
Ho deciso di avvicinarmi molto ad un approccio MVVM (Model View ViewModel) come pattern architetturale.
L'applicazione è sviluppata in due schermate: la prima è una table view con una lista di Pokemon, la seconda invece, è una schermata di dettaglio del pokemon.
Per la prima schermata ho utilizzato una semplice table view e le ho implementato un infinite scroll: vengono caricate 100 elementi per volta.
Utilizzando il UITableViewDataSourceePreftching sono riuscito ad impostare le condizioni affinché possano essere fetchati i nuovi dati.
Per prendere i dati che hanno popolato la mia applicazione ho utilizzato i servizi di API Rest offerti dal sito pokeapi.co .
In particolare ho utilizzato principalmente 2 servizi: il primo mi restituisce la lista di tutti i pokemon (suddivisa in pagine per implementare l'infinite scroll e quindi caricare le pagine solo quando viene richiesto) la seconda invece mi restituisce tutti i dati di un pokemon.
Le operazioni di fetching e parsing (da JSON alla nostra struttura dati) sono tutte affidate al Parser. Esso è responsabile di prendere i dati e convertirli nella nostra struttura dati.
Ho deciso di affidare le responsabilità per la navigazione tra le varie schermate, e la loro effettiva creazione, al Coordinator.
L'ApplicationCoordinator è quello che crea la root view, inserendola in uno UINavigationController.
Il viewControllerCoordinator invece, è responsabile della creazione di PokemonDetailsViewController al tap sulla determinata cella.

English

a simple iOS app developed using UIKit and without the use of XIB and Storyboard.

Development choises:
I decided to not use any external framework because I preferred to develop the code alone.
I decided to get very close to a MVVM (Model View Viewmodel) approach as an architectural pattern.
The application has two screens: the first one is a table view with a list of Pokemon, the second is a detail screen of the pokemon that you tapped on the first screen.
 Coordinator: I decided to use a Coordinator to move between my views. The application coordinator instanciate the UINavigationController and the root view controller; meanwhile the ViewControllerCoordinator pushes the PokemonDetailsView.
 For the first screen I used a simple table view and I implemented an infinite scroll: 100 items are loaded at a time.. Using the Uitableviewdatasourceepreftching I was able to set the conditions so that new data can be fetched.
 To take the data that populated my application I used the API Rest services offered by the site pokeapi.co .
 In particular I used only 2 services: the first gives me the list of all pokemon (divided into pages to implement the infinite scroll and then load the pages only when required) the second instead gives me all the pokemon's data.
 Fetching and parsing operations (from JSON to our data structure) are all entrusted to the Parser. It is responsible for taking the data and converting it into our data structure.
 I decided to entrust the responsibility for navigation between the various screens, and their actual creation, to the Coordinator.
 The ApplicationCoordinator is the one that creates the root view, inserting it in an UINavigationController.
 The ViewControllerCoordinator instead, is responsible for instantiate PokemonDetailsViewController tap on the given cell.
