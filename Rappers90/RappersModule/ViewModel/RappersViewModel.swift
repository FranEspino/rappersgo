//
//  RappersViewModel.swift
//  Rappers90
//
//  Created by vespro on 18/06/23.
//

import Foundation


class RappersViewModel: ObservableObject {
    @Published var rappers = [Rapper]()
    
    
    init(){
        let  url = URL(string: "https://649cad0e048075719238700e.mockapi.io/rappers")!
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){data, response,error in
            do{
                if let jsonData = data{
                    let decodeData = try
                    JSONDecoder().decode([Rapper].self, from: jsonData)
                    DispatchQueue.main.async {
                        self.rappers.append(contentsOf: decodeData)
                    }
                }
                    
            }catch{
                print("Error: \(error)")

            }
        }.resume()
    }
}
