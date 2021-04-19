//
//  SubmitContextViewController.swift
//  DictionDiary
//
//  Created by Mikayla Orange on 4/18/21.
//

import UIKit
import Parse

class SubmitContextViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var placeholder: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        contextTextView.delegate = self
        submitButton.layer.cornerRadius = 25
        submitButton.layer.shadowColor = UIColor.black.cgColor
        submitButton.layer.shadowOpacity = 0.2
        submitButton.layer.shadowOffset = .zero
        submitButton.layer.shadowRadius = 20
        self.contextTextView.becomeFirstResponder()
        self.contextTextView.layer.borderColor = UIColor.lightGray.cgColor
        self.contextTextView.layer.borderWidth = 1
        placeholder.isHidden = !contextTextView.text.isEmpty
        textViewDidChange(contextTextView)
        // Do any additional setup after loading the view.
    }
    
    /** Checks if sentence contains the word of the day. If so, it updates the point value*/
    @IBAction func onSubmit(_ sender: Any) {
        if (!contextTextView.text.isEmpty) {
            let wordsQuery = PFQuery(className: "PreviousWords")
            wordsQuery.limit = 20
            wordsQuery.findObjectsInBackground { (words,error) in
                if words != nil {
                    let wordCheck = words!.last?["word"] as! String
                    if self.contextTextView.text.contains(wordCheck) {
                        let user = PFUser.current()
                        var currPoints = user!["totalPoints"] as! Int
                        print(currPoints)
                        currPoints += 1
                        user!["totalPoints"] = currPoints
                        user?.saveInBackground()
                    }
                    
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholder.isHidden = !textView.text.isEmpty
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
