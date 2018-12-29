//
//  ViewController.swift
//  NewsReader_demo
//
//  Created by Emin Roblack on 12/28/18.
//  Copyright © 2018 emiN Roblack. All rights reserved.
//
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ad27cf29007846648b1d77ac7c5b41f1


import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  
  let newsUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ad27cf29007846648b1d77ac7c5b41f1"

  override func viewDidLoad() {
    super.viewDidLoad()
    getLatestNews(url: newsUrl)
  }
  
  
  //MARK:- Getting the News ------------------------------------------------
  func getLatestNews(url: String) {
    
    Alamofire.request(url, method: .get, parameters: nil).responseJSON {
      response in
      
      if response.result.isSuccess {
        print("We are a GO")
        
        // Get the json from results, and assign it to a variable
        let newsJSON: JSON = JSON(response.result.value ?? "default")
        self.updateLabels(json: newsJSON)
        print(newsJSON)
      } else {
        print("We got an error: \(response.result.error!)")
      }
    }
  }
  //------------------------------------------------------------------------
  
  
  //MARK:- Update view ------------------------------------------------
  func updateLabels(json: JSON) {
    titleLabel.text = json["articles"][0]["title"].stringValue
    contentLabel.text = json["articles"][0]["description"].stringValue
    let imageURL = json["articles"][0]["urlToImage"].stringValue
    
    // Get image from them internets
    Alamofire.request(imageURL).responseData {
      response in
      if let image = response.result.value {
        let image = UIImage(data: image)
        // show thy image
        self.imageView.image = image
      }
    }
  }
  //------------------------------------------------------------------------

  
  
}

