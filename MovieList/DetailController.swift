//
//  DetailController.swift
//  MovieList
//
//  Created by Luis Pinto on 28/02/2019.
//  Copyright © 2019 Luis Pinto. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = self.movie {
            titleLabel.text = movie.title
            aboutLabel.text = movie.about
            scoreLabel.text = movie.score
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
