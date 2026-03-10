//
//  MovieViewModel.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit

class MovieViewModel{
    var movies:[Movie] = []
    
    
    func fetchMovies(completion: @escaping () -> Void){
        guard let url = URL(string: "https://ghibliapi.vercel.app/films/") else {return}
        
       
        URLSession.shared.dataTask(with: url){
            data,response,error in
            guard let data = data else {return}
            
            do{
                let movie = try JSONDecoder().decode([Movie].self, from: data)
                
                DispatchQueue.main.async {
                    self.movies = movie
                    completion()
                    
                }
            }catch{
                
            }
        }.resume()
    }
    
    
    
    
    
    func numberOfMovies() -> Int{
        return movies.count
    }
    
    func movie(at index:Int) -> Movie{
        return movies[index]
    }
    
    
    func titleForMovie(at index:Int) -> String{
        return movies[index].title
    }
    
    
    
    func imageUrl(at index:Int) -> String{
        return movies[index].image
    }
    
    
    
    
    func fetchImage(from urlString:String, completion:@escaping (UIImage?)->()){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){
            data,_,_ in
            guard let data = data else {return}
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
            
        }.resume()
    }
    
    
}
