//
//  Movie_Cell.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit

class Movie_Cell: UICollectionViewCell {
    
    let imageview = UIImageView()
    let movie_label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageview)
        contentView.addSubview(movie_label)
        
        contentView.backgroundColor = .gray
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        movie_label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            imageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            movie_label.topAnchor.constraint(equalTo: imageview.bottomAnchor,constant: 5),
            movie_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movie_label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
        
        
        
    }
    
    
    required init?(coder:NSCoder){
        fatalError("")
    }
}
