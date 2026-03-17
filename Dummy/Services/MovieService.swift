//
//  MovieService.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit



class MovieService
{
    
    func fetchMovies(url:URL, completion:@escaping ([Movie])->()){
        URLSession.shared.dataTask(with: url){
            data,_,error in
            
            guard let data else{return}
            
            
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies)
                
            }catch{
                
            }
        }.resume()
    }
    
    
    
    
    
    
    func fetchImage(url:URL, completion:@escaping(UIImage?)->()){
        URLSession.shared.dataTask(with:url){
            data,_,_ in
            guard let data else {return}
            
            DispatchQueue.main.async {
                let img = UIImage(data: data)
                completion(img)
                
            }
            
            
        }.resume()
    }
}
