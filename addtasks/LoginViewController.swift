//
//  LoginViewController.swift
//  addtasks
//
//  Created by Diellza Bajrami on 7/13/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            //user is already logged in just navigate him to home screen
            let TodoTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TodoTableVC") as! TodoTableViewController
            self.navigationController?.pushViewController(TodoTableViewController, animated: false)
        }
    }
    
    @IBAction func rateBtn(_ sender: Any) {
        
        showAlert(title: "Alert!", message: "Do you like this app?")
    }
    @IBAction func LoginBtn(_ sender: Any) {
        
        if txtUsername.text == "admin" && txtPassword.text == "admin" {
            
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let TodoTableViewController =
            self.storyboard?.instantiateViewController(withIdentifier: "TodoTableVC")
            as! TodoTableViewController
            
            self.navigationController?.pushViewController(TodoTableViewController, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
