//
//  ViewController.swift
//  MovieApp
//
//  Created by Desilva, Kiran on 4/6/20.
//  Copyright © 2020 Desilva, Kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for:indexPath) as! CustomTableViewCell
        let idx: Int = indexPath.row
    
        moviecell.movieTitle?.text = favoriteMovies[idx].title
        moviecell.movieYear?.text = favoriteMovies[idx].year
        displayMovieImage(idx, moviecell: moviecell)
        return moviecell
    }
    
    func  displayMovieImage(_ row: Int, moviecell: CustomTableViewCell){
        let url: String = (URL(string: favoriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{ (data,
            response, error)-> Void in
            if error != nil{
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute:{
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
            
        }).resume()
    }
    
    

    var favoriteMovies: [Movie] = []
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewWillAppear( _ animated:Bool){
        mainTableView.reloadData()
        if favoriteMovies.count == 0 {
            favoriteMovies.append(Movie(id: "tt0372784", title: "Batman Begins", year: "2005",
                                         imageUrl: "https://images-na.ssl-images-amazon.com/images/M/MV5BNTM3OTc0MzM2OV5BM15BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg"))
        }
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

