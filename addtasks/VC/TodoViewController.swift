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
    var todo: Todo?
    
    
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
        
        if let todo = todo {
            textView.text = todo.title
            segmentedControl.selectedSegmentIndex = Int(todo.priority)
        }
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
    
    fileprivate func dismissAndResign() {
        dismiss(animated: true)
        
        textView.resignFirstResponder()
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        dismissAndResign()
    }
    
    @IBAction func done(_ sender: UIButton) {
        guard let title = textView.text, !title.isEmpty
            else{
                return
        }
        
        if let todo = self.todo{
            todo.title = title
            todo.priority = Int16(segmentedControl.selectedSegmentIndex)
        }else {
            
        
        
        let todo = Todo(context: managedContext)
        todo.title = title
        todo.priority = Int16(segmentedControl.selectedSegmentIndex)
        todo.date = Date()
            
        }
        
        do{
            try managedContext.save()
            dismissAndResign()
        }
        catch{
            print("Error saving task: \(error)")
        }
        
        
    }
   

}


extension TodoViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneBtn.isHidden {
            textView.text.removeAll()
            textView.textColor = .white
            
            doneBtn.isHidden = false
            
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
        }
    }
}


