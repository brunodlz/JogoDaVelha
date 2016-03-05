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
    
    @IBOutlet weak var reset: UIButton!
    @IBAction func buttonReset(sender: AnyObject) {
        
        var buttonToClear : UIButton!
        for var index = 0; index < 9; index++ {
            buttonToClear = view.viewWithTag(index) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        activePlayer = 1
        state = [0,0,0,0,0,0,0,0,0]
        
        self.reset.hidden = true
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if state[sender.tag] == 0 {
            state[sender.tag] = activePlayer
            if activePlayer == 1 {
                activePlayer = 2
                sender.setImage(UIImage(named: "ball"), forState: .Normal)
            } else {
                activePlayer = 1
                sender.setImage(UIImage(named: "cross"), forState: .Normal)
            }
        }
        
        for combination in winningCombinations {
            if state[combination[0]] != 0 &&
                state[combination[0]] == state[combination[1]] &&
                state[combination[1]] == state[combination[2]] {
                    
                if state[combination[0]] == 1 {
                    openAlert("Eu ganhei.")
                } else {
                    openAlert("Você ganhou.")
                }
                self.reset.hidden = false
            }
        }
    }
    
    func openAlert(message : String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

