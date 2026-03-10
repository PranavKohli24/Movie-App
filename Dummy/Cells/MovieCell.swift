//
//  MovieCell.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit

class MovieCell: UICollectionViewCell {
    let label = UILabel()
    let imageview = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        contentView.addSubview(imageview)
        
        contentView.backgroundColor = .systemGray2
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            imageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageview.bottomAnchor,constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        
        label.numberOfLines = 0
        label.textAlignment = .center
        
        
    }
    
    
    required init?(coder:NSCoder){
        fatalError("")
    }
}
