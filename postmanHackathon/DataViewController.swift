//
//  DataViewController.swift
//  postmanHackathon
//
//  Created by Alja Zorga Krizanic on 17/01/2021.
//

import UIKit
import SafariServices

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var recipes = [RecipeData]()
    var recipes1 = String()
    
    @IBOutlet weak var TableViewListAll: UITableView!
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.spoonacular.com/recipes/findByIngredients?apiKey=10da94bfb83e4fdfacf62713a4156fc0&ingredients=\(ing1),+\(ing2),+\(ing3)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    
                    self.recipes = try JSONDecoder().decode([RecipeData].self, from: data!)
                    print(self.recipes)
                    
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
            self.TableViewListAll.reloadData()
        }
        TableViewListAll.delegate = self
        TableViewListAll.dataSource = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(recipes.count)
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let post = self.recipes[indexPath.row]
        print(post.id)
        cell.textLabel?.text = post.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "showDetail", sender: self)
        recipes1 = self.recipes[indexPath.row].title
        var newString = recipes1.replacingOccurrences(of: " ", with: "-", options: .literal, range: nil)
        newString = newString.lowercased()
        newString = newString + "-" + String(self.recipes[indexPath.row].id)
        
        print(newString)
        
        let url = URL(string: "https://spoonacular.com/recipes/\(newString)")
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.recipe = recipes[(TableViewListAll.indexPathForSelectedRow?.row)!]
        }
    }

}
