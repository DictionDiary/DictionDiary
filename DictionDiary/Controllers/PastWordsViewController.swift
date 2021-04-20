//
//  PastWordsViewController.swift
//  DictionDiary
//
//  Created by Mikayla Orange on 4/8/21.
//

import UIKit
import Parse

class PastWordsViewController:
    UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var previousWordsArray = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadPrevious()
    }
    @objc func loadPrevious() {
        let previousQuery = PFQuery(className: "PreviousWords")
        previousQuery.includeKey("user")
        previousQuery.limit = 20
        previousQuery.findObjectsInBackground { (info,error) in
            if info != nil {
                self.previousWordsArray = info!
                
                print(self.previousWordsArray)
                self.tableView.reloadData()
            }
            else {
                print("empty...")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(previousWordsArray.count)
        return previousWordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
        let currWord = previousWordsArray[indexPath.row]
        cell.WOD.text = currWord["word"] as? String
        let pastWordDate = DateFormatter()
        pastWordDate.timeStyle = .none
        pastWordDate.dateStyle = .long
        
        cell.Date.text = pastWordDate.string(from: currWord["wordDate"] as! Date) as? String
        cell.Definition.text = currWord["definition"] as? String
        return cell
    }
    
    
    
    
}

