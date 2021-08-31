//
//  Categorytvc.swift
//  ShopME
//
//  Created by Andrew Bell on 2/27/20.
//  Copyright © 2020 Andrew Bell. All rights reserved.
//

import UIKit



class Categorytvc: UITableViewController, UINavigationControllerDelegate {
    
    
    var mycartitems = [String]()
    var mycartcost = [String]()
    
    var groc = [String]()
    var cloth = [String]()
    var mov = [String]()
    var gard = [String]()
    var elec = [String]()
    var book = [String]()
    var app = [String]()
    var toys = [String]()
    
    
    
    var allCategories = [Categoryitem]()
    
    var inccat = 0
    
    let cattitle = UIView()
    
    let navbimage = UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal)
    
    let navlabel = UILabel()
    
    var cartc = 0
    
    var item = 0
    
    @IBOutlet weak var cartbutton: UIBarButtonItem!
    
    @IBOutlet weak var cartupdate: UIBarButtonItem!
    
    
    @IBAction func cattocart(_ sender: Any) {
        
        performSegue(withIdentifier: "catstocart", sender: self)
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
       // print("willshow")
        
        if let cth = viewController as? home {
            cth.cartcount = cartc
            
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
     
             if segue.identifier == "catstocart" {
               
               // mycartitems.append(groc)
               // mycartitems.append(cloth)
               // mycartitems.append(mov)
               // mycartitems.append(gard)
               // mycartitems.append(elec)
               // mycartitems.append(book)
               // mycartitems.append(app)
               // mycartitems.append(toys)
                
               if let ctc = segue.destination as? cartvc {
                   
                ctc.cartcat = self.inccat
                ctc.mycitems = self.mycartitems
                ctc.myccost = self.mycartcost
                
                 }
                
             }
        
        }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        print("Selected category \(inccat)")
        
    
        cartbutton.image = navbimage
    
        navigationItem.rightBarButtonItem = cartbutton
        
        cartupdate.title = "\(cartc)"
    
        navigationItem.rightBarButtonItem = cartupdate
        
        
        if inccat == 2 {
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-1-tomatoes")!, catstr: "Tomato, per lb", descstr: "On the vine", pricestr: "$2.45"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-2-bananas")!, catstr: "Banana, per lb", descstr: "Very durable", pricestr: "$0.49"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-3-gala")!, catstr: "Apple", descstr: "Gala apples", pricestr: "$1.47"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-4-lettuce")!, catstr: "Lettuce", descstr: "Green leaf lettuce", pricestr: "$3.19"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-5-broccoli")!, catstr: "Broccoli", descstr: "Bunch", pricestr: "$1.99"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-6-milk")!, catstr: "Milk", descstr: "One box, organic", pricestr: "$4.49"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-7-bread")!, catstr: "Bread", descstr: "Loaf, sliced", pricestr: "$3.47"))
        allCategories.append(Categoryitem(catimg: UIImage(named:"grocery-8-eggs")!, catstr: "Eggs", descstr: "Dozen", pricestr: "$1.86"))
            //controls title
            navlabel.text = "Grocery"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
            
        }
        
        else if inccat == 3 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"tshirt")!, catstr: "T-shirt", descstr: "100% cotton", pricestr: "$12.13"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"sweater")!, catstr: "Sweater", descstr: "Not scratchy", pricestr: "$34.92"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"jeans")!, catstr: "Jeans", descstr: "Faded and blue", pricestr: "$45.67"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"khakis")!, catstr: "Khakis", descstr: "Ready to wear to work", pricestr: "$55.61"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"jacket")!, catstr: "Jacket", descstr: "Stay warm", pricestr: "$107.22"))
            //controls title
            navlabel.text = "Clothing"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 4 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"movies-1-shawshank")!, catstr: "Shawshank Redemption", descstr: "Written by Stephen King", pricestr: "$17.83"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"movies-2-lord-of-the-rings")!, catstr: "Lord of the Rings", descstr: "Directed by Peter Jackson", pricestr: "$18.76"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"movies-3-godfather")!, catstr: "Godfather", descstr: "A classic for a reason", pricestr: "$15.67"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"frozen")!, catstr: "Frozen 2", descstr: "Let it snow", pricestr: "$22.11"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"Spiderman")!, catstr: "Spiderman: Far From Home", descstr: "Spiderman goes to Europe", pricestr: "$19.14"))
            //controls title
            navlabel.text = "Movies"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 5 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-1-shovel")!, catstr: "Shovel", descstr: "Metal and wood", pricestr: "$22.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-2-tomato-plant")!, catstr: "Tomato plant", descstr: "Heirloom tomatoes", pricestr: "$4.87"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-3-mower")!, catstr: "Mower", descstr: "Gasoline push mower", pricestr: "$139.99"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-4-garden-soil")!, catstr: "Garden soil", descstr: "Potting soil", pricestr: "$5.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-5-fruit-tree")!, catstr: "Fruit tree", descstr: "Grows oranges", pricestr: "$87.67"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"garden-6-leaves-rake")!, catstr: "Rake", descstr: "Plastic and wood", pricestr: "$16.23"))
            //controls title
            navlabel.text = "Garden"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 6 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"ps4")!, catstr: "Playstation 4", descstr: "Videogame system", pricestr: "$399.99"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"cellphone")!, catstr: "Cellphone", descstr: "Samsung Galaxy S8", pricestr: "$564.87"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"tv")!, catstr: "Television", descstr: "40 inch Sony television", pricestr: "$1187.99"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"mac")!, catstr: "Desktop computer", descstr: "Macintosh computer", pricestr: "$2345.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"headphones")!, catstr: "Headphones", descstr: "Beats by Dre", pricestr: "$287.67"))
            //controls title
            navlabel.text = "Electronics"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 7 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"moonlight")!, catstr: "Moonlight", descstr: "By Barry Jenkins", pricestr: "$44.76"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"strong")!, catstr: "Strong Fathers, Strong Daughters", descstr: "By Meg Meeker", pricestr: "$25.23"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"book1")!, catstr: "Diary of a wimpy kid", descstr: "By Jeff Kinney", pricestr: "$33.56"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"book4")!, catstr: "Disappearing Earth", descstr: "By Julia Phillips", pricestr: "$34.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"book5")!, catstr: "Why we sleep", descstr: "By Mathew Walker", pricestr: "$28.72"))
            //controls title
            navlabel.text = "Books"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 8 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"dishwasher")!, catstr: "Dishwasher", descstr: "Clean all your dishes fast", pricestr: "$844.76"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"washer")!, catstr: "Washing Machine", descstr: "No more trips to the laundromat", pricestr: "$1125.23"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"oven")!, catstr: "Toaster Oven", descstr: "Make toast without burning it", pricestr: "$83.56"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"dryer")!, catstr: "Hair Dryer", descstr: "Dry your hair fast", pricestr: "$74.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"fridge")!, catstr: "Refrigerator", descstr: "Keep your food cold", pricestr: "$928.72"))
            //controls title
            navlabel.text = "Appliances"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else if inccat == 9 {
            allCategories.append(Categoryitem(catimg: UIImage(named:"lego")!, catstr: "Legos", descstr: "Build your imagination", pricestr: "$54.76"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"yoda")!, catstr: "Baby yoda doll", descstr: "Do or do not", pricestr: "$28.43"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"buzz")!, catstr: "Buzz Lightyear figure", descstr: "To infinity and beyond", pricestr: "$13.77"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"sloth")!, catstr: "Smooth moves sloth", descstr: "Great for learning", pricestr: "$38.63"))
            allCategories.append(Categoryitem(catimg: UIImage(named:"potato")!, catstr: "Mr. Potatohead", descstr: "A childhood classic", pricestr: "$10.72"))
            //controls title
            navlabel.text = "Toys"
                   navlabel.sizeToFit()
                   navlabel.center = cattitle.center
                   navlabel.textAlignment = NSTextAlignment.center
                   cattitle.addSubview(navlabel)
                   self.navigationItem.titleView = cattitle
                   cattitle.sizeToFit()
        }
            
        else {}
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCategories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categories", for: indexPath) as? placecategorycell{
            
            
            
            cell.categoryimage.image = allCategories[indexPath.row].placecatimage
            cell.categorylabel.text = allCategories[indexPath.row].placecatlabel
            cell.categorydesc.text = allCategories[indexPath.row].placecatdesc
            cell.categoryprice.text = allCategories[indexPath.row].placecatprice
            cell.addtocart.tag = indexPath.row
            
            return cell
        }

        return UITableViewCell()
    }
    
    
    
    @IBAction func submittocart(_ sender: UIButton) {
        
        print("Button with tag \(sender.tag) is clicked")
        
        let item = allCategories[sender.tag].placecatlabel
        let cost = allCategories[sender.tag].placecatprice
        
        cartc = cartc + 1
        
        
        self.tableView.reloadData()
        cartupdate.title = "\(cartc)"
        navigationItem.rightBarButtonItem = cartupdate
        
        if inccat == 2 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 3 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 4 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 5 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 6 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 7 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 8 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else if inccat == 9 {
            mycartitems.append(item)
            mycartcost.append(cost)
        }
        
        else {}
        
        
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Categoryitem {
    
    var placecatimage: UIImage
    var placecatlabel: String
    var placecatdesc: String
    var placecatprice: String
    
    
    init(catimg: UIImage, catstr: String, descstr: String, pricestr: String) {
        
        placecatimage = catimg
        placecatlabel = catstr
        placecatdesc = descstr
        placecatprice = pricestr
        
        
    }
    
    
    
}
