//
//  MovieViewModel.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit
import Combine



class MovieViewModel{
    
    @Published private(set) var movies:[Movie] = []
    
    let movieservice:MovieService
    
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
}
