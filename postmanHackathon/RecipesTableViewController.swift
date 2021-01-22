//
//  RecipesTableViewController.swift
//  postmanHackathon
//
//  Created by Alja Zorga Krizanic on 16/01/2021.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var recipes = [RecipeData]()
    
    @IBOutlet var TableViewListAll: UITableView!
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?apiKey=10da94bfb83e4fdfacf62713a4156fc0&ingredients=\(ing1),+\(ing2),+\(ing3)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    self.recipes = try JSONDecoder().decode([RecipeData].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("Successfully")
        }
         
        TableViewListAll.delegate = self
        TableViewListAll.dataSource = self
    
        
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(recipes.count)
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //cell.backgroundColor = .red
        let post = self.recipes[indexPath.row]
        print(post)
        cell.textLabel?.text = post.title
        
        return cell
    }
  

}
