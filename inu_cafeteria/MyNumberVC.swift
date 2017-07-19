//
//  MyNumberVC.swift
//  inu_cafeteria
//
//  Created by SeonIl Kim on 2017. 7. 18..
//  Copyright © 2017년 appcenter. All rights reserved.
//

import UIKit

class MyNumberVC: UIViewController {
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberL: UILabel!
    @IBOutlet weak var numberTitleL: UILabel!
    
    @IBOutlet weak var cView: UICollectionView!
    
    let cellId = "NumberCell"
    
    let items = ["501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512"]
    
    var bTitle:String = "" {
        didSet {
            if titleL != nil {
                titleL.text = bTitle
            }
        }
    }
    var number:String = "" {
        didSet {
            if numberL != nil {
                numberL.text = String(number)
            }
        }
    }
    
    override func viewDidLoad() {
        titleL.font = UIFont(name: "KoPubDotumPB", size: 20)
        numberL.font = UIFont(name: "KoPubDotumPB", size: 72)
        numberTitleL.font = UIFont(name: "KoPubDotumPB", size: 15)
        cView.isScrollEnabled = false
        cView.isUserInteractionEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let logoIV = UIImageView(image: UIImage(named: "nav_logo"))
        logoIV.contentMode = .scaleAspectFit
        logoIV.frame = CGRect(x: 0, y: 0, width: 130, height: 21.5)
        self.navigationItem.titleView = logoIV
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.bTitle = { self.bTitle }()
        self.number = { self.number }()
    }

}

extension MyNumberVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NumberCell
        cell.label.text = items[indexPath.row]
        return cell
    }
}

class NumberCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        label.font = UIFont(name: "KoPubDotumPB", size: 24)
        label.textColor = UIColor(r: 98, g: 150, b: 174)
    }
}