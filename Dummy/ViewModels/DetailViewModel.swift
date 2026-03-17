//
//  DetailViewModel.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit
import Combine

class DetailViewModel{
    @Published var cast:[Cast] = []
    
    let castservice:CastService
    
    init(castservice:CastService){
        self.castservice = castservice
    }
    
    
    func numberOfCast()->Int{
        return cast.count
    }
    
    func castPerson(at index:Int) -> Cast{
        return cast[index]
    }
    
    
    
    
    func fetchCast(_ castUrls:[String]){
        for u in castUrls{
            guard let url = URL(string: u) else {return}
            
            castservice.fetchCast(url: url){
                c in
                if let c{
                    DispatchQueue.main.async {
                        self.cast.append(c)
                        
                    }
                    
                }
                
            }
            
            
        }
    }
}
