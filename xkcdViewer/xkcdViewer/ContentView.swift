//
//  ContentView.swift
//  xkcdViewer
//
//  Created by Patrick Moran on 10/11/22.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    // Initial comic data
    @ObservedObject var newData:API_Data = API_Data(ComicNum: 2656)
    @State var comicURL: String = "https://imgs.xkcd.com/comics/scientific_field_prefixes.png"
    @State var comicTitle: String = "Scientific Field Prefixes"
    @State var comicNumber: Int = 2656
    @State var comicDate_day: String = "8"
    @State var comicDate_month: String = "8"
    @State var comicDate_year: String = "2022"
    
    // Object to hold current comic data
    @ObservedObject var currentComicData:API_Data = API_Data(ComicNum: 0)
    @State var currentComicNumber: Int = 0
    
    // Misc Variables
    @State var userSearch: String = ""
    @State var errorText: String = ""
    @State var confettiCounter: Int = 0
    
    var body: some View {
        // MARK: - Title
        Text("xkcd comic viewer").font(.largeTitle).bold().padding()
                
        // MARK: - Image information
        HStack{
            VStack(alignment: .trailing){
                Text("Title: ")
                    .multilineTextAlignment(.trailing)
                Text("Number: ")
                    .multilineTextAlignment(.trailing)
                Text("Date: ")
                    .multilineTextAlignment(.trailing)
            }
            VStack(alignment: .leading){
                Text(self.comicTitle)
                    .multilineTextAlignment(.leading)
                Text(String(self.comicNumber))
                    .multilineTextAlignment(.leading)
                Text(self.comicDate_day + "/" + self.comicDate_month + "/" + self.comicDate_year)
                    .multilineTextAlignment(.leading)
            }.frame(width: 250, alignment: .leading)

        }
        
        
        // MARK: - Image
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: comicURL),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 380, maxHeight: 550)
                    //.border(.blue)
            },
                       placeholder: {
                ProgressView()
            }
            )
        } else {
            // Fallback on earlier versions
            // Buy the new iPhone!!!  ;)
        }
        
        
        // MARK: - Error Text
        Text(errorText).foregroundColor(.red).bold()
        
        
        // MARK: - Navigation
        VStack{
            // MARK: -- Nav Buttons
            HStack(alignment: .bottom){
                Button("<< Prev"){
                    self.currentComicNumber = currentComicData.comicNumber
                    if (self.comicNumber > 1){
                        self.errorText = ""
                        self.comicNumber -= 1
                        updateUI(num: self.comicNumber)
                    }
                }
                .padding()
                .border(Color(UIColor.separator))
                
                Button("Random"){
                    self.errorText = ""
                    self.currentComicNumber = currentComicData.comicNumber
                    self.comicNumber = Int.random(in: 1...currentComicNumber)
                    self.confettiCounter = comicNumber
                    updateUI(num: self.comicNumber)
                }
                .padding()
                .border(Color(UIColor.separator))
                .confettiCannon(counter: $confettiCounter)

                
                Button("Next >>"){
                    self.currentComicNumber = currentComicData.comicNumber
                    if (self.comicNumber < self.currentComicNumber){
                        self.errorText = ""
                        self.comicNumber += 1
                        updateUI(num: self.comicNumber)
                    }
                }
                .padding()
                .border(Color(UIColor.separator))
            }
            
            
            // MARK: -- Search Bar
            HStack{
                TextField("Comic number", text: $userSearch)
                .padding()
                .border(Color(UIColor.separator))
                .frame(width: 202)
                
                Button("Search"){
                    self.currentComicNumber = currentComicData.comicNumber
                    self.comicNumber = Int(userSearch) ?? 1
                    
                    if (comicNumber < 1){
                        self.errorText = "Out of range: displaying comic # 1"
                        updateUI(num: 1)
                    } else if (comicNumber > currentComicNumber){
                        self.errorText = "Out of range: displaying comic # " + String(currentComicNumber)
                        updateUI(num: currentComicNumber)
                    } else {
                        self.errorText = ""
                        updateUI(num: comicNumber)
                    }
                }
                .padding()
                .border(Color(UIColor.separator))
            }
            
        }

    }
    
    
    func updateUI (num: Int){
        let update = API_Data.init(ComicNum: num)
        sleep(1)  // sleep to give time for fetch
        
        self.comicURL = update.comicURL
        self.comicTitle = update.comicTitle
        self.comicNumber = update.comicNumber
        self.comicDate_day = update.comicDate_day
        self.comicDate_month = update.comicDate_month
        self.comicDate_year = update.comicDate_year
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
