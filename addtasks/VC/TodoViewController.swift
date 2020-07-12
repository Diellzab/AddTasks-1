//
//  TodoViewController.swift
//  addtasks
//
//  Created by Diellza Bajrami on 7/10/20.
//  Copyright © 2020 dardan bakiu. All rights reserved.
//



import UIKit
import CoreData

class TodoViewController: UIViewController {
    
    
    //MARK: - Properties
    var managedContext: NSManagedObjectContext!
    
    
    //MARK: Outlets

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the .
        textView.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(with:)),
            name: .UIKeyboardWillShow,
            object: nil
        )
    }

    
    
    
    //MARK: Actions
    
    @objc func keyboardWillShow(with notification: Notification){
        let key  = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue
            else {
                return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height + 16
        
        bottomConstraint.constant = keyboardHeight
        
        UIView.animate(withDuration: 0.3) {
            
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        dismiss(animated: true)
        
        textView.resignFirstResponder()
    }
    
    @IBAction func done(_ sender: UIButton) {
        guard let title = textView.text, !title.isEmpty
            else{
                return
        }
        
        let todo = Todo(context: managedContext)
        todo.title = title
        todo.priority = Int16(segmentedControl.selectedSegmentIndex)
        todo.date = Date()
        
        do{
            try managedContext.save()
            dismiss(animated: true)
            textView.resignFirstResponder()
        }
        catch{
            print("Error saving task: \(error)")
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


extension TodoViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneBtn.isHidden {
            textView.text.removeAll()
            textView.textColor = .white
            
            doneBtn.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}


