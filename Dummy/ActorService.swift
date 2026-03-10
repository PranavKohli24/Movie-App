//
//  ActorService.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//
import UIKit

class ActorService{
    func fetchActors(url:URL, completion:@escaping (Actors?) -> Void){
        URLSession.shared.dataTask(with: url){
            data,_,_ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            
            
            do{
                let actor = try JSONDecoder().decode(Actors.self, from: data)
                completion(actor)
            }catch{
                completion(nil)
                
            }
            
            


        }.resume()
        
        
    }
    
    
}
