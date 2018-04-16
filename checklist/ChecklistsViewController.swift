//
//  ViewController.swift
//  checklist
//
//  Created by Mobil Trakya on 4/9/18.
//  Copyright © 2018 Trakya University. All rights reserved.
//

import UIKit

class ChecklistsViewController: UITableViewController {
    
    var items:[ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        let row0item = ChecklistItem()
        row0item.text="Walk the dog"
        row0item.checked=true
        items.append(row0item)
        
        let row1item=ChecklistItem()
        row1item.text="Brush my teeth"
        row1item.checked=true
        items.append(row1item)
        
        let row2item=ChecklistItem()
        row2item.text="Learn iOS development"
        row2item.checked=true
        items.append(row2item)
        
        let row3item=ChecklistItem()
        row3item.text="Soccer practice"
        row3item.checked=true
        items.append(row3item)
        
        let row4item=ChecklistItem()
        row4item.text="Eat ice cream"
        row4item.checked=true
        items.append(row4item)
        
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = " I am new row"
        item.checked=false
        items.append(item)
        
        let indexPath = IndexPath(row : newRowIndex , section : 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label  = cell.viewWithTag(1000) as! UILabel
        let labelRowNumber  = cell.viewWithTag(1001) as! UILabel
        
        labelRowNumber.text="\(indexPath.row+1)"
        let item = items[indexPath.row]
        
        label.text=item.text
        labelRowNumber.text="\(indexPath.row+1)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        
        tableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell=tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.checked = !item.checked
            configureCheckmark(for: cell, at: indexPath)
        }
    }
    
    func configureCheckmark(for cell:UITableViewCell ,at indexPath :IndexPath){
        
        let item=items[indexPath.row]
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
}
