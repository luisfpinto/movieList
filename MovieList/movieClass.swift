//
//  movieClass.swift
//  MovieList
//
//  Created by Luis Pinto on 28/02/2019.
//  Copyright © 2019 Luis Pinto. All rights reserved.
//

import Foundation

class Movie: NSObject {
    var title : String
    var about : String
    var score: String
    init(title: String, about: String, score: String) {
        self.title = title
        self.about = about
        self.score = score
        super.init()
    }
}
