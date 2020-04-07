//
//  Movie.swift
//  MovieApp
//
//  Created by Desilva, Kiran on 4/6/20.
//  Copyright © 2020 Desilva, Kiran. All rights reserved.
//

import Foundation

class Movie{
    var id:String = ""
    var title: String = ""
    var year: String = ""
    var imageUrl: String = ""
    var plot: String = ""
    
    init(id:String, title: String, year: String, imageUrl: String, plot: String = ""){
        self.id = id
        self.title = title
        self.year = year
        self.imageUrl = imageUrl
        self.plot = plot
    }
}
