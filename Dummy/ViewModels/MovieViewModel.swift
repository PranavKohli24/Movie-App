//
//  MovieViewModel.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit
import Combine



class MovieViewModel{
    
    @Published var movies:[Movie] = []
    
    let movieservice:MovieService
    
    
    var desc:String?
    var producer:String?
    var director:String?
    var release_date:String?
    
    init(movieservice:MovieService){
        self.movieservice = movieservice
    }
    
    func numberOfMovies() -> Int{
        return movies.count
    }
    
    func movie(at index:Int) -> Movie{
        return movies[index]
    }
    
    
    func fetchMovies(){
        guard let u = URL(string:"https://ghibliapi.vercel.app/films/") else {return}
        
        movieservice.fetchMovies(url: u){
            movies in
            DispatchQueue.main.async {
                self.movies = movies
            }
        }
    }
    
    
    func fetchImage(at index:Int, completion:@escaping (UIImage?)->()){
        
        let movie_url = movies[index].image
        
        guard let u = URL(string: movie_url) else {return}
        
        movieservice.fetchImage(url: u){
            img in completion(img)
        }
        
    }
    
    
    
    func movieDescription(at index:Int) -> String{
        print("desc")
        print(movies.count)
        return movies[index].description
    }
    
    func movieTitle(at index:Int) -> String{
        print("hello")
        print(movies.count)
        print(index)
        return movies[index].title
        
    }
    
    func movieProducer(at index:Int) -> String{
        return movies[index].producer
    }
    
    func movieDirector(at index:Int) -> String{
        return movies[index].director
    }
    
    func movieReleaseDate(at index:Int) -> String{
        return movies[index].release_date
    }
}
