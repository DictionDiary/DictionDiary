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
var previousWords = [PFObject]()
    
override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.delegate = self
        tableView.dataSource = self
    
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.cornerRadius = 50
        APICaller()
//
//        let query = PFQuery(className:"PreviousWords")
//        query.includeKeys(["word", "definition", "wordDate"])
//        query.limit = 20
//        query.findObjectsInBackground { (previousWords, error) in
//            if previousWords != nil {
//                self.previousWords = previousWords!
//                print("not empty")
//                self.previousWords.last?["word"] as! String
//            }
//        }
    }
    func APICaller() {
        let wordsQuery = PFQuery(className: "PreviousWords")
        wordsQuery.includeKey("user")
        wordsQuery.limit = 20
        wordsQuery.findObjectsInBackground { (words,error) in
            if words != nil {
                print("hooray!")
                //                        print(words)
                self.previousWords = words!
                let currDateFormat = DateFormatter()
                let otherDateFormat = DateFormatter()
                currDateFormat.timeStyle = .none
                otherDateFormat.timeStyle = .none
                if currDateFormat.string(from: Date()) == otherDateFormat.string(from: self.previousWords.last?["wordDate"] as! Date) {
                    print("no new word")
                }
                else {
                    WordsAPICaller.getRandomWordRequest()
                }
                let wordOfTheDay = self.previousWords.last
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
                cell.WOD .text = (wordOfTheDay?["word"] as! String)
                cell.Definition.text = (wordOfTheDay?["definition"] as! String)
               // cell.date = (wordOfTheDay?["wordDate"]) as? UILabel

                
                //                        print(self.previousWords)
            }
            else {
                print("empty...")
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let previousWord = previousWords[section]
        let words = (previousWord["word"] as? [PFObject]) ?? []
        return words.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return previousWords.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let previousWord = previousWords[indexPath.section]
        let words = (previousWord["word"] as? [PFObject]) ?? []
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
            
            
            cell.WOD.text = previousWord["word"] as! String
            
            cell.Date.text = previousWord["wordDate"] as! String
            
            cell.Definition.text = previousWord["definition"] as! String
            
            return cell
        }
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell")!
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousWord = previousWords[indexPath.section]
        let words = (previousWord["word"] as? [PFObject]) ?? []
        
        if indexPath.row == words.count {
            becomeFirstResponder()
        }
        

    }
 
 
//
//            let main = UIStoryboard(name: "Main", bundle: nil)
//            let pwViewController = main.instantiateViewController(withIdentifier: "PreviousWordsViewController")
//            let delegate =  self.view.window?.windowScene?.delegate as! SceneDelegate
//            delegate.window?.rootViewController = pwViewController
//        }
       
}

