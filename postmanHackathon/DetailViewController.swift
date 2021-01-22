//
//  DetailViewController.swift
//  postmanHackathon
//
//  Created by Alja Zorga Krizanic on 18/01/2021.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    var recipe:RecipeData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(recipe?.id)
        
        let url = URL(string: "https://spoonacular.com/recipes/turkish-delight-664089")
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true)
        
    }
    


}
