//
//  ViewController.swift
//  MoviesApp
//
//  Created by Mohamed Gamal on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var data = [movie]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myindicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let parameters: [String: String] = ["s": "avengers","apiKey": "b52fc4a5"]
        myindicator.startAnimating()
        Alamofire.request("http://www.omdbapi.com", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (myResponse) in
            self.myindicator.stopAnimating()
            do{
                 let myReasult = try JSONDecoder().decode(SearchReasult.self, from: myResponse.data!)
                if let model = myReasult.Search {
                    self.data = model
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("error is :\(error)")
            }
           
        }
      
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell") as! MoviesCell
        cell.lbl.text = movie.Title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = data[indexPath.row]
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        view.movieDetails = movie
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


}

