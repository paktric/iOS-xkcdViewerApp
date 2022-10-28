//
//  API_Model.swift
//  xkcdViewer
//
//  Created by Patrick Moran on 10/13/22.
//

import Foundation

struct API_Model: Decodable{
    /*  example JSON format:
     {
         "month": "10",
         "num": 2684,
         "link": "",
         "year": "2022",
         "news": "",
         "safe_title": "Road Space Comparison",
         "transcript": "",
         "alt": "I wonder how hard it would be to ride an electric scooter in a hamster ball.",
         "img": "https://imgs.xkcd.com/comics/road_space_comparison.png",
         "title": "Road Space Comparison",
         "day": "12"
     }
    */
    
    var img:   String = ""
    var title: String = ""
    var num:   Int = 0
    var day:   String = ""
    var month: String = ""
    var year:  String = ""
    
}
