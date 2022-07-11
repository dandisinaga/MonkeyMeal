//
//  FtuxProvider.swift
//  MonkeyMeal
//
//  Created by Mochamad Dandi on 08/06/22.
//

import UIKit

class FtuxProvider {
    static let shared: FtuxProvider = FtuxProvider()
    private init() { }
    
    func loadFtuxes(completion: @escaping (Result<[Ftux], Error>) -> Void) {
        let data: [Ftux] = [
            Ftux(
                image: "img_ftux_1", title: "Find Food You Love", subtitle: "Discover the best foods from over 1.000 restaurant and fast delivery to your doorstep"),
            Ftux(image: "img_ftux_2", title: "Fast Delivery", subtitle:
                "Fast food delivery to your home , office wherever you are"),
            Ftux(image: "img_ftux_3", title: "Live Tracking", subtitle: "Real time tracking of your food on the app once you placed the order"),
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(data))
        }
    }
}
