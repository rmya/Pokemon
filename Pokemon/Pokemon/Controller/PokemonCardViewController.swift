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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.roundCorner()
        self.flipCard()
    }

    func flipCard(){
        
        if isFlipped {
            UIView.transition(with: cardView, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
            self.isFlipped = false
        }else {
            UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromTop) {
                UIView.animate(withDuration: 0.5, delay: 0.5,
                                      usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
                   
                    let groupAnimation = CAAnimationGroup()
                    groupAnimation.beginTime = CACurrentMediaTime()
                    groupAnimation.duration = 0.5
                    groupAnimation.fillMode = .backwards
                    
                    let scaleDown = CABasicAnimation(keyPath: "transform.scale")
                    scaleDown.fromValue = 1.0
                    scaleDown.toValue = 1.0
                    
                    let rotate = CABasicAnimation(keyPath: "transform.rotation")
                    rotate.fromValue = .pi / 3.0
                    rotate.toValue = 0.0
                    
                    groupAnimation.animations = [scaleDown, rotate]
                    self.cardView.layer.add(groupAnimation, forKey: nil)

                }, completion: nil)
                
            } completion: { Bool in
                self.isFlipped = true
            }
        }
        
    }

}

