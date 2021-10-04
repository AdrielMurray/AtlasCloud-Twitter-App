//
//  TweetCell.swift
//  Twitter
//
//  Created by Adriel Murray on 9/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var TwitterName: UILabel!
    
    
    @IBOutlet weak var TweetSection: UILabel!
    
    
    @IBOutlet weak var ProfilePic: UIImageView!
    
    @IBOutlet weak var FavButton: UIButton!
    
    @IBOutlet weak var RetweetButton:
        UIButton!
    
    
    
    @IBAction func FavoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        
        if(tobeFavorited) {
            
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: { self.setFavorite(true)
            }, failure: { (error) in
           print("Favorite error:  \(error)")
    })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: { self.setFavorite(false)
            }, failure: { (error) in
           print("Unfavorite error:  \(error)")
            
        })
        }
    }
        var tweetId:Int = -1
        var favorited:Bool = false
        //function to change favorite icon from grey to red
        func setFavorite(_ isFavorited:Bool){
            favorited = isFavorited
            
            if(favorited){
                
                FavButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            }
            else {
                FavButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            }
        }
        
        
        
    
    
    @IBAction func Retweet(_ sender: Any) {
    
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success:
       { self.setRetweet(true)
        }, failure: { (error) in
       print("Favorite error:  \(error)")
       
        
    }
        )}
    
    
    
    func setRetweet(_ isRetweeted:Bool) {
        
        if(isRetweeted) {
            RetweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            RetweetButton.isEnabled = false
        }
        else {
            RetweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            RetweetButton.isEnabled = true
        }
    }
    
    
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
