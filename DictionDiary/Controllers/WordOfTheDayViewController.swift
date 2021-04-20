//
//  WordOfTheDayViewController.swift
//  DictionDiary
//
//  Created by Mikayla Orange on 4/17/21.
//

import UIKit
import Parse

class WordOfTheDayViewController: UIViewController {
    @IBOutlet weak var wordOfTheDayLabel: UILabel!
    @IBOutlet weak var partOfSpeechLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    var wordOfTheDayDictionary: [String: Any?] = [:]
    var previousWords = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.cornerRadius = 50
        APICaller()
    }
    /** function that calls the HTTP request in API.Swift. If the date of the last value in the array is today, then it doesn't get a new word, otherwise, it calls the API again. */
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
                self.wordOfTheDayLabel.text = (wordOfTheDay?["word"] as! String)
                self.definitionLabel.text = (wordOfTheDay?["definition"] as! String)
                self.partOfSpeechLabel.text = (wordOfTheDay?["partOfSpeech"] as! String)
                
                //                        print(self.previousWords)
            }
            else {
                print("empty...")
            }
            
        }
    }
    
}
