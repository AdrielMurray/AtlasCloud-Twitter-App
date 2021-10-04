//
//  TweetViewController.swift
//  Twitter
//
//  Created by Adriel Murray on 9/29/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class TweetViewController: UIViewController, UITextViewDelegate {

    
    
    @IBAction func CancelTweet(_ sender: Any) {
        //dismiss to return to other screen
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    // function for posting tweets
    @IBAction func Tweetfunc(_ sender: Any) {
        
        if (!tweetTextView.text.isEmpty) {
            
            TwitterAPICaller.client?.tweetPost(tweetString: tweetTextView.text, success: { self.dismiss(animated: true, completion: nil)}, failure: { (error) in
                print("Error posting tweet  \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
            }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //this code makes curser and keyboard show up when a user is ready to type text
        tweetTextView.becomeFirstResponder()
        
        tweetTextView.text = "Type tweet here"
        tweetTextView.textColor = UIColor.lightGray
        tweetTextView.font = UIFont(name: "verdana", size: 13.0)
        tweetTextView.returnKeyType = .done
        tweetTextView.delegate = self
  

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tweetTextView.text == "Type tweet here" {
            tweetTextView.text = ""
            tweetTextView.textColor = UIColor.black
            tweetTextView.font = UIFont(name: "verdana", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if  text == "\n" {
            tweetTextView.resignFirstResponder()
        }
        return true
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
