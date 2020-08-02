//
//  MemeCell.swift
//  MemeMe-v2.0
//
//  Created by Herbert Dodge on 7/10/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let reuseID = "MemeTableCell"
    let memeImageView = UIImageView()
    let memeText = UILabel()
    
    //MARK: - Intializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuration
    
    func configureCell(with meme: Meme) {
        memeImageView.image = meme.memedImage
        memeText.text = meme.topText + " " + meme.bottomText
    }
    
    func configure() {
        addSubviews(memeImageView, memeText)
        memeText.text = "PLACEHOLDER TEXT"
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            memeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            memeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            memeImageView.heightAnchor.constraint(equalToConstant: 90),
            memeImageView.widthAnchor.constraint(equalToConstant: 90),
            
            memeText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            memeText.leadingAnchor.constraint(equalTo: memeImageView.trailingAnchor, constant: 24),
            memeText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            memeText.heightAnchor.constraint(equalToConstant: 40)
            
        
        ])
    }
    
}
