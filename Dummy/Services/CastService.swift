//
//  CastService.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit

class CastService{
    
    func fetchCast(url:URL, completion:@escaping (Cast?)->()){
        URLSession.shared.dataTask(with: url){
            data,_,_ in
            
            guard let data else {
                completion(nil)
                return}
            
            do{
                let c = try JSONDecoder().decode(Cast.self, from: data)
                
                completion(c)
                
                
                
            }catch{
                completion(nil)
            }
        }.resume()
    }
}
