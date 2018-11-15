//
//  ArtCollectionViewCollection.swift
//  CreativeevitaerC
//
//  Created by Denna, Zachary on 11/7/18.
//  Copyright © 2018 Denna, Zachary. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artidentifier"

public class ArtCollectionViewCollection: UICollectionViewController
{
    //MARK: DATA MEMBERS FOR CREATIVITY SCREEN
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCs : [UIImage?]  =
    {//list in swift
        return [
            UIImage(named: "wizardCat"),
            UIImage(named: "spokbon"),
            UIImage(named: "bnehaiku"),
            UIImage(named: "bottomText"),
            UIImage(named: "bowBones"),
            UIImage(named: "haikubon"),
            UIImage(named: "helthBone"),
            UIImage(named: "my image"),
            UIImage(named: "pepe")
            
            
        ]
    }()
    
    private let labels : [String] =
    {//array list of strings
        return [
            "cat",
            "bone",
            "artbone",
            "rattle me bone",
            "dangerBone",
            "bone bone bone bone bone bone",
            "wellBone",
            "mydrawing",
            "shadilay"
            
        ]
    }()
    //MARK: - Lifecycle
    // mark is used like java doc
  public override func viewDidLoad()  -> Void
  {
        super.viewDidLoad()// when screen initalizes

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    
    

        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return creativeCs.count
        
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell// the _ means it doesnt have an outside name
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .purple
        artCell.artImage.image = creativeCs[indexPath.row]
        artCell.artLabel.text = labels[indexPath.row]
    
      
    
        return artCell
    }

    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionView,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let paddingSpace = sectionInsets.left *  (itemsPerRowCompact + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
                                
    }
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        let imageView = UIImageView(image: creativeCs[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    @objc
    private func dissmissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }

}
