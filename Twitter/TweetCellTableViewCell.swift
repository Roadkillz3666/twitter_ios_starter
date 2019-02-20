//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Rodrigo Lapenne on 2/13/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var reTweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    
    
    
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavortire(true)
            }, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavortire(false)
            }, failure: { (Error) in
                print("unFavorite did not succeed: \(Error)")
            })
        }
    }
    
    @IBAction func reTweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setReTweeted(true)
        }, failure: { (Error) in
            print("Error in retweeting: \(Error)")
        })
    }
    
    func setReTweeted(_ isReTweeted:Bool){
        if(isReTweeted){
            reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        }else{
            reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    
    func setFavortire(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
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
