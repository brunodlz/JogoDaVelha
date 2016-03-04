//
//  ViewController.swift
//  Jogo da Velha
//
//  Created by Bruno da Luz on 3/4/16.
//  Copyright © 2016 Hazorlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1
    
    var state = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2],
                               [3,4,5],
                               [6,7,8],
                               [0,3,6],
                               [1,4,7],
                               [2,5,8],
                               [0,4,8],
                               [2,4,6]]
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if state[sender.tag] == 0 {
            state[sender.tag] = activePlayer
            if activePlayer == 1{
                activePlayer = 2
                sender.setImage(UIImage(named: "ball"), forState: .Normal)
            } else {
                activePlayer = 1
                sender.setImage(UIImage(named: "cross"), forState: .Normal)
            }
        }
        
        for combination in winningCombinations {
            if state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]] {
                if state[combination[0]] == 1 {
                    openAlert("Eu ganhei.\nParabêns.")
                } else {
                    openAlert("Você ganhou.\nParabêns.")
                }
            }
        }
    }
    
    func openAlert(message : String) {
        let alert = UIAlertController(title: "Fim", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) -> Void in
            //here reset game.
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

