//
//  Cast_Cell.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit

class Cast_Cell: UICollectionViewCell {
    let cast_label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cast_label)
        contentView.backgroundColor = .darkGray
        
        cast_label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cast_label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cast_label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cast_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cast_label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        cast_label.textAlignment = .center
        
        
    }
    
    required init?(coder:NSCoder){
        fatalError("")
    }
}
