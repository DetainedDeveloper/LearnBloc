class Pokemon {
  final String name, pokemonUrl;
  final int height, weight, xp;

  const Pokemon({
    required this.name,
    required this.pokemonUrl,
    required this.height,
    required this.weight,
    required this.xp,
  });

  factory Pokemon.fromData(Map<String, dynamic> data) {
    return Pokemon(
      name: data['name'] ?? 'Unknown',
      pokemonUrl: data['pokemonUrl'] ?? 'Unknown',
      height: data['height'] ?? 0,
      weight: data['weight'] ?? 0,
      xp: data['xp'] ?? 0,
    );
  }
}
