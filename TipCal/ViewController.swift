//
//  ViewController.swift
//  TipCal
//
//  Created by Siddharth Patel on 2/3/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import UIKit
class TADViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var CalculateButton: UIButton!
    @IBOutlet weak var BillAmountText: UITextField!
    @IBOutlet weak var TipCalculatedLabel: UILabel!
    @IBOutlet weak var TipSlider: UISlider!
    
    
    @IBOutlet weak var TipCalculatedByUser: UILabel!
    @IBOutlet weak var LabelForBill: UILabel!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
  
    @IBAction func CalTipSlider(_ sender: UISlider) {
        
        let userInput = Float(BillAmountText.text!)
        //let currentValue = Int(sender.value)
        if (userInput == nil)
        {
            let alertController = UIAlertController(title: "Tip Cal", message:
                "Bill Amount can not be 0 or less", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }else
        {
            
            TipCalculatedByUser.text = String(self.TipSlider.value)
            LabelForBill.text = BillAmountText.text
            
        }
    }

    @IBAction func CalculateButtonPressed(_ sender: Any) {
        
        let userBill = Int(BillAmountText.text!)
        var tip = Int(TipCalculatedByUser.text!)
        let totalBill = (userBill! * tip!)/100
        TipCalculatedLabel.text = String(userBill! + totalBill)
        
    
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
