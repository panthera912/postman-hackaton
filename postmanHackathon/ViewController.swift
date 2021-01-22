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

    
    /*func getData() {
        let urlString = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=10da94bfb83e4fdfacf62713a4156fc0&ingredients=\(ing1),+\(ing2),+\(ing3)"
        print(urlString)
        let url = URL(string: urlString)
        
        print(url)
        var a = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=10da94bfb83e4fdfacf62713a4156fc0&ingredients=apples,+flour,+sugar"
        a = urlString
        URLSession.shared.dataTask(with: URL(string: a)!) { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
                    // Convert to dictionary where keys are of type String, and values are of any type
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [[String: Any]]
                    
                    // Access specific key with value of type String
                    //print(json)
                    //let str = json["key"] as! String
                } catch {
                    // Something went wrong
                }
            }
        }.resume()
    }*/
    
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

