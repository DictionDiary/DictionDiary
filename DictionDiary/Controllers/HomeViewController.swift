//
//  HomeViewController.swift
//  DictionDiary
//
//  Created by Mikayla Orange on 4/8/21.
//

import UIKit
import Parse

class HomeViewController: UIViewController {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let todaysDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        dateLabel.text = formatter.string(from: todaysDate)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate =  self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = loginViewController
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
