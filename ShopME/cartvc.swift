//
//  cartvc.swift
//  ShopME
//
//  Created by Andrew Bell on 3/1/20.
//  Copyright © 2020 Andrew Bell. All rights reserved.
//

import UIKit

class cartvc: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var homebutton: UIBarButtonItem!

    @IBOutlet weak var emptyb: UIButton!
    
    @IBOutlet weak var submitb: UIButton!
    
    @IBOutlet weak var totalcost: UILabel!
    
    @IBOutlet weak var totalq: UILabel!
    
    var cartcat = 0
    
    let carttitle = UIView()
    
    let navilabel = UILabel()
    
    var mycitems = [String]()
    var myccost = [String]()
    
    
    @IBOutlet weak var carttableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carttableview.delegate = self
        carttableview.dataSource = self
    
        
        homebutton.image = UIImage(named: "homeButton")?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItem = homebutton
        
        navilabel.text = "Your Cart"
        navilabel.sizeToFit()
        navilabel.center = carttitle.center
        navilabel.textAlignment = NSTextAlignment.center
        carttitle.addSubview(navilabel)
        self.navigationItem.titleView = carttitle
        carttitle.sizeToFit()
        
        carttableview.reloadData()
        //carttableView.delegate = self
        //carttableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mycitems.count
        return mycitems.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartcell", for: indexPath) as! CartCell
        
         // Fetch the data for the row.
        let thelabel = mycitems[indexPath.row]
        let thecost = myccost[indexPath.row]
              
         // Configure the cell’s contents with data from the fetched object.
        //cell.cartname?.text = "hello"
        
        cell.cartname?.text = thelabel
        cell.cartcost?.text = thecost
        cell.cartiq?.text = "1"
            return cell
      
        
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class CartCell: UITableViewCell {
    @IBOutlet var cartname : UILabel?
    @IBOutlet var cartcost : UILabel?
    @IBOutlet var down : UIButton?
    @IBOutlet var up : UIButton?
    @IBOutlet var cartiq : UILabel?

}
