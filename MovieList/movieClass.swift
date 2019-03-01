//
//  movieClass.swift
//  MovieList
//
//  Created by Luis Pinto on 28/02/2019.
//  Copyright © 2019 Luis Pinto. All rights reserved.
//

import Foundation
import UIKit

class Movie: NSObject {
    var title : String
    var about : String
    var score: String
    var imageURL: String
    init(title: String, about: String, score: String, imageURL: String) {
        self.title = title
        self.about = about
        self.score = score
        self.imageURL = imageURL
        super.init()
    }
    func getImage() -> Data {
        var data : Data?
        let URLImage = URL(string: "http://image.tmdb.org/t/p/w500\(imageURL)")
        do{
            data = try Data(contentsOf: URLImage!)
        } catch let err{
            print(err)
        }
        return data!
    }
}
