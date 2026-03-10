//
//  Movie.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import Foundation



struct Movie:Decodable{
    let id:String
    let title:String
    let image:String
    let description:String
    let director:String
    let producer:String
    let people:[String]
}
