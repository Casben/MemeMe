//
//  SentMemeTableVC.swift
//  MemeMe-v2.0
//
//  Created by Herbert Dodge on 7/10/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit

class SentMemeTableVC: UITableViewController {
    
    //MARK: - Properties

    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    //MARK: - Lifecyles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    

    
    //MARK: - Configuration
    
    func configure() {
        self.modalPresentationStyle = .fullScreen
        configureNavigationBar(withTitle: "Sent Memes")
        tableView.register(MemeTableViewCell.self, forCellReuseIdentifier: MemeTableViewCell.reuseID)
        tableView.removeExcessCells()
    
        
    }
    
    //MARK: - TableView Configuration 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = memes[indexPath.row]
        let destinationVC = MemeDetailVC()
        destinationVC.meme = meme
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemeTableViewCell.reuseID) as! MemeTableViewCell
        let meme = self.memes![(indexPath as NSIndexPath).row]
        cell.configureCell(with: meme)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


