//
//  SecondViewController.swift
//  MoviesApp
//
//  Created by Mohamed Gamal on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit
import Kingfisher
class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var movieDetails: movie?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoveImageCell") as! MoveImageCell
            let url = URL(string: movieDetails!.Poster ?? "")
            cell.img.kf.setImage(with: url)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoveDetailsCell") as! MoveDetailsCell
            if(indexPath.row == 1){
                cell.lbl.text = "Title is : \(movieDetails!.Title ?? "")"
            } else if (indexPath.row == 2){
                cell.lbl.text = "Release Year : \(movieDetails!.Year ?? "")"
            } else {
                cell.lbl.text = "imdbID : \(movieDetails!.imdbID ?? "")"
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 350
        } else {
            return UITableView.automaticDimension
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
