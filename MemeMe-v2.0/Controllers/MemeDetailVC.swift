//
//  MemeDetailVC.swift
//  MemeMe-v2.0
//
//  Created by Herbert Dodge on 7/13/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

class MemeDetailVC: UIViewController {

    //MARK: - Properties
    var meme: Meme!
    var detailedMemeImageView = UIImageView()
    
    
    //MARK: - Lifecyles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Helpers
    
    func configure() {
        view.backgroundColor = .systemGray5
        view.addSubviews(detailedMemeImageView)
        configureNavBar()
        
        NSLayoutConstraint.activate([
            detailedMemeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailedMemeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailedMemeImageView.heightAnchor.constraint(equalToConstant: 350),
            detailedMemeImageView.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        detailedMemeImageView.image = meme.memedImage
    }
    
    func configureNavBar() {
        let rightShareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(presentActivityVC))
        rightShareButton.tintColor = .systemIndigo
        navigationItem.rightBarButtonItem = rightShareButton
    }

    //MARK: - Methods
    
    @objc func presentActivityVC() {
        let resendMeme = meme.memedImage
        let shareSheet = UIActivityViewController(activityItems: [resendMeme], applicationActivities: nil)
        shareSheet.completionWithItemsHandler = { (_, completed, _, _) in
            if (completed) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        present(shareSheet, animated: true, completion: nil)
    }
}
