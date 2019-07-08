//
//  MoviesModel.swift
//  MoviesApp
//
//  Created by Mohamed Gamal on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct SearchReasult: Codable {
    var Search: [movie]?
    var totalResults: String?
    var Response: String?
    
}


struct movie: Codable {
    var Title: String?
    var Year: String?
    var imdbID: String?
    var Poster: String?
    
}
