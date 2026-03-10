//
//  DescCell.swift
//  Dummy
//
//  Created by Pranav Kohli on 09/03/26.
//

import UIKit

class DescCell: UICollectionViewCell {
    let label = UILabel()
    let desc_label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(desc_label)
        
        desc_label.numberOfLines = 0
        desc_label.textAlignment = .center

        contentView.backgroundColor = .systemGray
        
        desc_label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            desc_label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            desc_label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            desc_label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            
        ])
        
        
        
        contentView.addSubview(label)
        
        
        label.textAlignment = .center
        label.backgroundColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
        
        
        
        
        
        
    }
    
    required init?(coder:NSCoder){
        fatalError("")
    }
}
