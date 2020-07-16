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
        
        let alert = UIAlertController(title: "Alert!", message: "Do you like this app?", preferredStyle: .alert)
        let yesBtn = UIAlertAction(title: "Yes", style: .default, handler: self.yess)
        let noBtn = UIAlertAction(title: "No", style: .cancel, handler: self.noo)
        alert.addAction(yesBtn)
        alert.addAction(noBtn)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func yess(alert: UIAlertAction!){
        print("Yes")
        
    }
    
    func noo(alert: UIAlertAction!){
        print("No")
    }
    @IBAction func LoginBtn(_ sender: Any) {
        
        if txtUsername.text == "admin" && txtPassword.text == "admin" {
            
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let TodoTableViewController =
            self.storyboard?.instantiateViewController(withIdentifier: "TodoTableVC")
            as! TodoTableViewController
            
            self.navigationController?.pushViewController(TodoTableViewController, animated: true)
        }
        
        else {
            let alert1 = UIAlertController(title: "Alert", message: "Username or password are incorrect", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert1.addAction(ok)
            present(alert1, animated: true, completion: nil)
            
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
