//
//  Desc_Cell.swift
//  Dummy
//
//  Created by Pranav Kohli on 10/03/26.
//

import UIKit

class Desc_Cell: UICollectionViewCell {
    
    let desc_label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(desc_label)
        
        contentView.backgroundColor = .systemGray
        
        desc_label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desc_label.topAnchor.constraint(equalTo: contentView.topAnchor),
            desc_label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            desc_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            desc_label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        desc_label.numberOfLines = 0
        desc_label.textAlignment = .center
        
    }
    
    
    required init?(coder:NSCoder){
        fatalError("")
    }
}
