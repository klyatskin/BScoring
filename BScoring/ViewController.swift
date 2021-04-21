//
//  ViewController.swift
//  BScoring
//
//  Created by Konstantin Klyatskin on 2021-04-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var txtFieldPins: UITextField!
    @IBOutlet weak var lblFrameRoll: UILabel!
    
    let scoring = Scoring()
    
    @IBAction func btnTapped(_ button: UIButton) {
        if (button === btnReset) {
            txtFieldPins.text = ""
            scoring.reset()
            updateUI()
        } else if (button == btnEnter) {
            if pinsEntryAccepted(txtFieldPins) {
                txtFieldPins.text = ""
                updateUI()
            } else {
                print("Incorrect input: \(String(describing: txtFieldPins.text))")
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        scoring.reset()
        updateUI()
        txtFieldPins.becomeFirstResponder()

    }

    
    func updateUI() {
        lblScore.text = String(scoring.score)
        lblFrameRoll.text = scoring.currentFrameRollString
    }
}



extension ViewController {
    
    func pinsEntryAccepted(_ textField: UITextField) -> Bool {
        
        guard let string = textField.text,
              string.isInteger(),
              let pins = Int(string) else {
            return false
        }
        return scoring.rollWith(pins: pins)
    }
    
}
