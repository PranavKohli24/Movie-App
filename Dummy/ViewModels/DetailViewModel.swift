//
//  DetailViewModel.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit
import Combine



class DetailViewModel{
//    @Published var actors:[Actors] = []
//    
    @Published var actors:[Actors] = []
    
    
    let actorService:ActorService
    
    init(actorService:ActorService){
        self.actorService = actorService
    }
    
    
    
    func fetchActors(_ actorUrls:[String]){
        for u in actorUrls{
            guard let url = URL(string: u) else {return}
            
            
            actorService.fetchActors(url: url, completion: {
                actor in
                if let actor = actor {
                    DispatchQueue.main.async {
                        self.actors.append(actor)
                        
                    }
                }
            })
                    
        }
    }
    
    
    func numberOfActors() -> Int{
        return actors.count
    }
    
    
    func nameForActor(at index:Int) -> String{
        return actors[index].name
    }
}
