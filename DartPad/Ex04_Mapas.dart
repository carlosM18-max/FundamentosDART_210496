void main() {
  final pokemon = {
    "Name" : "Pikachu",
    "HP" : 100,
    "isAlive" : true,
    "abilities" : ['Impact Trueno', 'Cola de Hierro', 'Rapido'],
    "sprites" : 
    {
      1: "pikachu/front.png",
      2: "pikachu/back.png"
    }
  };

  final Map<String, dynamic> trainer = {
    'Name' : 'Ash Ketchup',
    'Gender' : 'Male',
    'Age' : 12,
    'isGymnasiumLeader' : false
  };

  final pokemons = {
    1: "Pikachu",
    2: "Greninja",
    3: "Lucario",
    4: "Palkia"
  };
  
// Imprimir los datos del mapa
print("""
Los datos del pokemon son usando el Mapa son:
------------------------------------------------
Pokemon = $pokemon
Trainer = $trainer
Pokemons = $pokemons
""");
print("*********************************************************");
print("""
Accediendo a las propiedades del pokemon usandon los braquets/corchetes []:
------------------------------------------------

Nombre = ${pokemon['Name']}
HP = ${pokemon['HP']}
Vivo = ${pokemon['isAlive']}
Sprites = ${pokemon['sprites' ]}
------------------------------------------------
""");

// Reto 01: Obtenert el valor independioente de las imagenes del front y back del pokemon

// Front: ${(pokemon['sprites'])[1]}
// Back: ${(pokemon['sprites'])[2]}

// Dado que la solucion ya esta obsoleta lo que queda es crear una nueva variables
// con el objeto y destructurar las imagenes para acceder a ella

final tmp_sprites = pokemon['sprites'] as Map<int,String>;

print("""
Accediendo a las propiedades del pokemon usandon los braquets/corchetes []:
------------------------------------------------

Nombre = ${pokemon['Name']}
HP = ${pokemon['HP']}
Vivo = ${pokemon['isAlive']}
Sprites = ${pokemon['sprites' ]}
------------------------------------------------
Back: ${tmp_sprites[2]}
Front: ${tmp_sprites[1]}
""");
}