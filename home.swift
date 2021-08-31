//
//  home.swift
//  ShopME
//
//  Created by Andrew Bell on 2/26/20.
//  Copyright © 2020 Andrew Bell. All rights reserved.
//

import UIKit

extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

private let reuseIdentifier = "Cell"

class home: UICollectionViewController, UINavigationControllerDelegate {
    
    
    var allCollections = [Collection]()
    
    var catvalue = 0
    
    var cartcount = 0
    
    var totalcartcount = 0
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let vctitle = UIImage(named: "logo")
        let vctitleimageView = UIImageView(image: vctitle)
        
        self.navigationItem.titleView = vctitleimageView
        
        let bg = UIImage(named: "background-home")
        let transparentbg = bg?.image(alpha: 0.3)
        
        background.image = transparentbg

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        allCollections.append(Collection(img: UIImage(named:"category-1-recent")!, str: "Recent Orders"))
        allCollections.append(Collection(img: UIImage(named:"category-2-cart")!, str: "Cart (\(cartcount))"))
        allCollections.append(Collection(img: UIImage(named:"category-3-grocery")!, str: "Grocery"))
        allCollections.append(Collection(img: UIImage(named:"category-4-clothing")!, str: "Clothing"))
        allCollections.append(Collection(img: UIImage(named:"category-5-movies")!, str: "Movies"))
        allCollections.append(Collection(img: UIImage(named:"category-6-garden")!, str: "Garden"))
        allCollections.append(Collection(img: UIImage(named:"category-7-electronics")!, str: "Electronics"))
        allCollections.append(Collection(img: UIImage(named:"category-8-books")!, str: "Books"))
        allCollections.append(Collection(img: UIImage(named:"category-9-appliances")!, str: "Appliances"))
        allCollections.append(Collection(img: UIImage(named:"category-10-toys")!, str: "Toys"))
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("did appear")
        
        allCollections.removeAll()
        
        allCollections.append(Collection(img: UIImage(named:"category-1-recent")!, str: "Recent Orders"))
        allCollections.append(Collection(img: UIImage(named:"category-2-cart")!, str: "Cart (\(cartcount))"))
        allCollections.append(Collection(img: UIImage(named:"category-3-grocery")!, str: "Grocery"))
        allCollections.append(Collection(img: UIImage(named:"category-4-clothing")!, str: "Clothing"))
        allCollections.append(Collection(img: UIImage(named:"category-5-movies")!, str: "Movies"))
        allCollections.append(Collection(img: UIImage(named:"category-6-garden")!, str: "Garden"))
        allCollections.append(Collection(img: UIImage(named:"category-7-electronics")!, str: "Electronics"))
        allCollections.append(Collection(img: UIImage(named:"category-8-books")!, str: "Books"))
        allCollections.append(Collection(img: UIImage(named:"category-9-appliances")!, str: "Appliances"))
        allCollections.append(Collection(img: UIImage(named:"category-10-toys")!, str: "Toys"))
        
       let indexPath = IndexPath(item: 1, section: 0)
    
        collectionView.reloadItems(at: [indexPath])
       
    }
   
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected section \(indexPath.section) row \(indexPath.row)")
       
    
        catvalue = indexPath.row
        print("Selected main category \(catvalue)")
        
        if (catvalue > 1) {
        performSegue(withIdentifier: "cats", sender: self)
        }
        
        if (catvalue == 0) {
            performSegue(withIdentifier: "hometorecent", sender: self)
        }
        
        if (catvalue == 1) {
        performSegue(withIdentifier: "hometocart", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using [segue destinationViewController].
           // Pass the selected object to the new view controller.
           
                if segue.identifier == "cats" {
                      
                      if let svc = segue.destination as? Categorytvc {
                          
                       svc.inccat = self.catvalue
                        svc.cartc = self.cartcount
                        
                      }
                }
        
                if segue.identifier == "hometocart" {
                  
                  if let htc = segue.destination as? cartvc {
                      
                   htc.cartcat = self.catvalue
                   
                    }
                }
        
                if segue.identifier == "hometorecent" {
              
              if let htr = segue.destination as? recentorderstvc {
                  
               htr.reccat = self.catvalue
               
                    }
            }
           
           
       }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allCollections.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collections", for: indexPath) as? PlaceCollection {
            
           
            
            cell.placeImageView.image = allCollections[indexPath.row].placeImage
            cell.placeLabel.text = allCollections[indexPath.row].placeLabel
            
            return cell
        }
    

    
        return UICollectionViewCell()
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    @IBAction func myUnwindSegueFunc(unwindSegue: UIStoryboardSegue){
        
        print("came back to first page")
    }
    
    
    
    
    
}






class Collection {
    
    var placeImage: UIImage
    var placeLabel: String
    
    init(img: UIImage, str: String) {
        
        placeImage = img
        placeLabel = str
    }
    
}
