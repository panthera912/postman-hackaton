//
//  ViewController.swift
//  postmanHackathon
//
//  Created by Alja Zorga Krizanic on 16/01/2021.
//

import UIKit

var ing1 = String()
var ing2 = String()
var ing3 = String()

class ViewController: UIViewController {

    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    @IBAction func goBtn(_ sender: Any) {
        ing1 = text1.text!
        print("First: " + ing1)
        
        ing2 = text2.text!
        print("Second: " + ing2)
        
        ing3 = text3.text!
        print("Third: " + ing3)
        
        
        //getData()
        print("Ime recepta")
        print()
        
        
        performSegue(withIdentifier: "goToRecipes", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    


}

