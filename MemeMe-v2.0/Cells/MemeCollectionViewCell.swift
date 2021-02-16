//
//  MemeCollectionViewCell.swift
//  MemeMe-v2.0
//
//  Created by Herbert Dodge on 7/11/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    
    static let reuseID = "MemeCollectionCell"
    var memeImageCell = UIImageView()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Helpers
    
    func configure() {
        addSubview(memeImageCell)
        memeImageCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memeImageCell.topAnchor.constraint(equalTo: self.topAnchor),
            memeImageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            memeImageCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            memeImageCell.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        ])
    }
}
