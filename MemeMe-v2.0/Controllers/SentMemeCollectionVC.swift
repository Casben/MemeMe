//
//  SentMemeCollectionVC.swift
//  MemeMe-v2.0
//
//  Created by Herbert Dodge on 7/10/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

class SentMemeCollectionVC: UICollectionViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var flowLayOut: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    //MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    //MARK: - Helpers
    
    func configure() {
        configureNavigationBar(withTitle: "Sent Memes")
        collectionView.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: MemeCollectionViewCell.reuseID)
        configureFlowLayout()
        
    }
    
    func configureFlowLayout() {
        let space: CGFloat = 3.0
        let dimension = (view.frame.width - (2 * space)) / 3.0
        
        flowLayOut.minimumInteritemSpacing = space
        flowLayOut.minimumLineSpacing = space
        flowLayOut.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    
    //MARK: - CollectionView Configuration
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemeCollectionViewCell.reuseID, for: indexPath) as! MemeCollectionViewCell
        let meme = self.memes![(indexPath as NSIndexPath).row]
        cell.memeImageCell.image =  meme.memedImage
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme = memes[indexPath.row]
        let destinationVC = MemeDetailVC()
        destinationVC.meme = meme
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}
