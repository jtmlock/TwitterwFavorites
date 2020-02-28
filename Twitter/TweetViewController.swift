//
//  TweetViewController.swift
//  Twitter
//
//  Created by Mac on 2/20/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
 //   textView.delegate = self
    
 //   func textView(_ textView, shouldChangeTextIn range: NSRange, replacementText: String) -> Bool{
        // TODO : Check the proposed new text character count
        
        // Set the max Character Limit
  //      let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
  //      let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // Update Character count Label
        
        // The new text should be allowed? True/false
    //    return newText.characters.count < characterLimit
        
        // Allow or disable the new text
    //}

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil) 
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else{
            self.dismiss(animated: true, completion: nil)
        }
        
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
