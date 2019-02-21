//
//  WalkingtreeTableViewController.swift
//  WalkingTree
//
//  Created by Anna Oh on 19/2/2019.
//  Copyright © 2019 Anna Oh. All rights reserved.
//

import UIKit
private let reuseIdentifier = "TreeCell"
//private let treeArraykey = "TREE_ARRAY_KEY"

//Data element for table row.
//Note the "Codable" protocal
struct Tree: Codable {
    var date: String
    var stepCount: Int
}

class WalkingtreeTableViewController: UITableViewController {
//    var treeArray = [Tree]()

    //var elementary = [Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("view did load")
//        if let data = UserDefaults.standard.value(forKey: treeArrayKey) as? Data {
//
//            let treeArray = try? PropertyListDecoder().decode(Array<Tree>.self, from: data)
//
//            self.treeArray = treeArray!
//
//            self.tableView.reloadData()
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
         print("numberOfSections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRowsInSection")
        return 5
    }


    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TreeCell", for: indexPath)
        print("Configure the cell", indexPath.row)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController {

            vc.treeName = "My Great Tree"
            
            vc.didSaveTree = { treeDataArray in
                print("In call back function")
                print(treeDataArray)

            }
            
            
        }
        
    }

}
