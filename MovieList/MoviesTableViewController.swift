//
//  MoviesTableViewController.swift
//  MovieList
//
//  Created by Luis Pinto on 28/02/2019.
//  Copyright © 2019 Luis Pinto. All rights reserved.
//

import UIKit
import Alamofire


class MoviesTableViewController: UITableViewController {
    var movies: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()

        Alamofire.request("https://api.themoviedb.org/3/discover/movie?api_key=48a2e2ba2451c8381dda4de36e50a609&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1").responseJSON {response in
            if let resultJSON = response.result.value as? [String: Any] {
                if let movieList = resultJSON["results"] as? [[String: Any]] {
                    movieList.forEach{ movie in
                        let movieTitle = movie["title"] as! String
                        let movieAbout = movie["overview"] as! String
                        let movieScore = movie["vote_average"]
                        let imageURL = movie["poster_path"] as! String
                        let movie = Movie(title: movieTitle, about: movieAbout, score: "\(String(describing: movieScore!))", imageURL: imageURL)
                        self.movies.append(movie)
                    }
                    activityIndicatorView.removeFromSuperview()
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "movieInfo") {
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            let movie = self.movies[indexPath.row]
            let destination = segue.destination as! DetailController
            destination.movie = movie
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Number of movies")
        print(self.movies.count)
        return self.movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        let movie = self.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        print("******")
        print(cell)
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


