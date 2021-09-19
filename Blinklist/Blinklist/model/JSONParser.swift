//
//  DataLoader.swift
//  Blinklist
//
//  Created by Decagon on 04/08/2021.
//

import UIKit

protocol JSONParserProtocol {
  func fetchData(from data: [Author] )
}

class JSONParser {
  // Mark Attributes
  var delegate: JSONParserProtocol?
  
  var authorData:[Author] = []
  
  // MARK closure
  func parseJSON(completionHandler: (([Author]) -> Void)?) {
    if let resourceURL = Bundle.main.url(forResource: "jsonData", withExtension: "json"){
      do{
        let data = try Data(contentsOf: resourceURL)
        let jsonContent = try JSONDecoder().decode([Author].self, from: data)
        //self.authorData = jsonContent
        completionHandler?(jsonContent)
      }catch{
        print("\(error)")
      }
    }
  }
}

