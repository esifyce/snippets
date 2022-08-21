//
//  ChartsViewModel.swift
//  BarLineChart
//
//  Created by Krasivo on 21.08.2022.
//

import UIKit

protocol ChartsViewModelProtocol {
    var dataEntries: [PointEntry] { get }
}

class ChartsViewModel: ChartsViewModelProtocol {
    
    let dataEntries = [        
        PointEntry(value: 5, title: "Nigger"),
        PointEntry(value: 39, title: "Sucker"),
        PointEntry(value: 22, title: "Dumb"),
        PointEntry(value: 80, title: "Fool"),
        PointEntry(value: 50, title: "Freak"),
        PointEntry(value: 50, title: "Shit"),
        PointEntry(value: 13, title: "Whore"),
        PointEntry(value: 70, title: "Fuck"),
        PointEntry(value: 13, title: "Bitch"),
        PointEntry(value: 26, title: "Bullshit")
    ]
}
