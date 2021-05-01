PokemonListSwift:
a simple iOS app developed using UIKit and without the use of XIB and Storyboard.

Development choises:
1. Coordinator: I decided to use a Coordinator to move between my views. The application coordinator instanciate the UINavigationController and the root view controller; meanwhile the ViewControllerCoordinator pushes the PokemonDetailsView.
2. Parser: The parser is the component that allows me to send an APIRest Get operation to pokeapi.co . I take all my datas from this API, calling fetchAllPokemons and fetchPokemonDetails methods. The parser is also responsable to parse the data that I receive from the API, from JSON to a data structure.
