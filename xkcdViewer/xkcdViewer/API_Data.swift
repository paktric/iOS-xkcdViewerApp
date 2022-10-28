//
//  API_Data.swift
//  xkcdViewer
//
//  Created by Patrick Moran on 10/13/22.
//

import Foundation

class API_Data: ObservableObject{
    var comicURL: String = ""
    var comicTitle: String = ""
    var comicNumber: Int = 0
    var comicDate_day: String = ""
    var comicDate_month: String = ""
    var comicDate_year: String = ""
    
    
    init(ComicNum: Int){
        if (ComicNum <= 0){
            fetchAPIData_current(completionHandler: {(data) in
                self.comicURL = data.img
                self.comicTitle = data.title
                self.comicNumber = data.num
                self.comicDate_day = data.day
                self.comicDate_month = data.month
                self.comicDate_year = data.year
            }, comicNum: ComicNum)
        } else {
            fetchAPIData(completionHandler: {(data) in
                self.comicURL = data.img
                self.comicTitle = data.title
                self.comicNumber = data.num
                self.comicDate_day = data.day
                self.comicDate_month = data.month
                self.comicDate_year = data.year
            }, comicNum: ComicNum)
        }
    }
    
    func fetchAPIData_current(completionHandler: @escaping (API_Model) -> Void, comicNum: Int) {
        let url = URL(string: "https://xkcd.com/info.0.json")!
        var task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else { return }
            do{
                let comicData = try JSONDecoder().decode(API_Model.self, from: data)
                completionHandler(comicData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }).resume()
    }
    
    func fetchAPIData(completionHandler: @escaping (API_Model) -> Void, comicNum: Int) {
        let url = URL(string: "https://xkcd.com/" + String(comicNum) + "/info.0.json")!
        var task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else { return }
            do{
                let comicData = try JSONDecoder().decode(API_Model.self, from: data)
                completionHandler(comicData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }).resume()
    }
    
    
}
