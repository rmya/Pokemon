//
//  PokemonCardViewController.swift
//  Pokemon
//
//  Created by Rumeysa TAN on 10.08.2022.
//

import UIKit

class PokemonCardViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var hpPoint: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackPoint: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defensePoint: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    
    var isFlipped = false
    
    private var pokemonURLs = [String]()
    private var pokemonIndex = 0
    
    private var pokemon : Pokemon? {
        didSet{
            guard let pokemon = pokemon else {
                return
            }
            pokemonName.text = pokemon.name.capitalized
            pokemonImage.setURLImage(pokemon.sprites.front_default)
            hpPoint.text = String(pokemon.stats[0].base_stat)
            attackPoint.text = String(pokemon.stats[1].base_stat)
            defensePoint.text = String(pokemon.stats[2].base_stat)

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.roundCorner()
        self.showNextPokemon()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showNextPokemon))
        cardView.addGestureRecognizer(tap)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getAllPokemonFromURLs()
    }
    
    func getAllPokemonFromURLs(){
        NetworkManager.networkManager.getAllPokemons { pokemonEntries in
            for entry in pokemonEntries {
                self.pokemonURLs.append(entry.url)
                }
            }
       
        }
    
    @objc func showNextPokemon(){
        pokemonIndex += 1
        NetworkManager.networkManager.getPokemon(withUrl: String(self.pokemonIndex)) { pokemon in
            DispatchQueue.main.async {
                self.pokemon = pokemon

            }
        }
        self.flipCard()
    }
    
    func flipCard(){
        
        UIView.transition(with: cardView, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
    }

}

