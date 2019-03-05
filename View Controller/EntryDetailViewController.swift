//
//  EntryDetailViewController.swift
//  CreativeJournalApp
//
//  Created by Jack Knight on 3/4/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        updateViews()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            textView.becomeFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func updateViews() {
        guard let unwrappedEntry = entry else { return }
        title = unwrappedEntry.title
        titleTextField.text = unwrappedEntry.title
        textView.text = unwrappedEntry.text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        textView.text = ""
    }
    
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        guard textView.text != "", textView.text != "",
            let entryText = textView.text,
            let entryTitle = titleTextField.text else {return}
        if let entry = entry {
            EntryController.shared.update(entry: entry, title: entryTitle, text: entryText)
        } else {
            EntryController.shared.addEntry(title: entryTitle, text: entryText)
        }
        navigationController?.popViewController(animated: true)
        
    }
}

