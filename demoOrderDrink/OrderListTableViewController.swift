//
//  OrderListTableViewController.swift
//  demoOrderDrink
//
//  Created by Daniel on 2020/4/18.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class OrderListTableViewController: UITableViewController {
    
    var orderDrinkArray = [OrderDrink]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let urlAddress = "https://sheetdb.io/api/v1/egm9oej0f2byk"
            if let url = URL(string: urlAddress){
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let drinkResults = try? JSONDecoder().decode([OrderDrink].self, from: data) {
                        
                        self.orderDrinkArray = drinkResults
                        
//                        for i in 0...drinkResults.count - 1{
//                            let name = drinkResults[i].name
//                            let drinkname = drinkResults[i].drinkname
//                            let ice = drinkResults[i].ice
//                            let suger = drinkResults[i].suger
//                            let capacity = drinkResults[i].capacity
//                            let bubble = drinkResults[i].bubble
//                            self.orderDrinkArray.append(OrderDrink(name: name, drinkname: drinkname, ice: ice, suger: suger, bubble: bubble, capacity: capacity))
//                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }.resume()
            
            }
        
    }
        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderDrinkArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListCell", for: indexPath) as! OrderListTableViewCell
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor(red: 22/255, green: 58/255, blue: 77/255, alpha: 1)
        }else{
            cell.backgroundColor = UIColor.white
        }
        
        
        let orderDrink = orderDrinkArray[indexPath.row]
        cell.name.text = orderDrink.name
        cell.drinkname.text = orderDrink.drinkname
        cell.ice.text = orderDrink.ice
        cell.bubble.text = orderDrink.bubble
        cell.capacity.text = orderDrink.capacity
        cell.suger.text = orderDrink.suger

        // Configure the cell...

        return cell
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
