//
//  ViewController.swift
//  TipCal
//
//  Created by Siddharth Patel on 2/3/17.
//  Copyright © 2017 Siddharth Patel. All rights reserved.
//

import UIKit
class TADViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var BillAmountText: UITextField!
    @IBOutlet weak var TipCalculatedLabel: UILabel!
    @IBOutlet weak var TipSlider: UISlider!
    
    @IBOutlet weak var userTipCalculated: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
  
    @IBAction func CalTipSlider(_ sender: UISlider) {
        
        let userInput = Int(BillAmountText.text!)
        //let currentValue = Int(sender.value)
        if (userInput == nil)
        {
            let alertController = UIAlertController(title: "Tip Cal", message:
                "Bill Amount can not be 0 or less", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }else
        {
            
            let tip = Int(self.TipSlider.value)
            let totalBill = Int((userInput! * tip)/100)
            TipCalculatedLabel.text = String(userInput! + totalBill)
            userTipCalculated.text = String (totalBill)

        }
    }
    func didTapView(){
        self.view.endEditing(true)
    }
    
    
}
