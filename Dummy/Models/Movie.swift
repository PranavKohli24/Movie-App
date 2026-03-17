//
//  Movie.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

struct Movie:Decodable{
    let id:String
    let title:String
    let image:String
    let description:String
    let director:String
    let producer:String
    let people:[String]
}
