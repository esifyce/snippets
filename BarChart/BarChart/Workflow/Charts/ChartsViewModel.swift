//
//  ChartsViewModel.swift
//  BarChart
//
//  Created by Krasivo on 21.08.2022.
//

import UIKit

protocol ChartsViewModelProtocol {
    var dataEntries: [DataEntry] { get }
}

class ChartsViewModel: ChartsViewModelProtocol {
    var dataEntries = [
        DataEntry(color: UIColor.gray, height: 0.1, textValue: "5", title: "Nigger"),
        DataEntry(color: UIColor.yellow, height: 0.6, textValue: "39", title: "Sucker"),
        DataEntry(color: UIColor.cyan, height: 0.3, textValue: "22", title: "Dumb"),
        DataEntry(color: UIColor.magenta, height: 0.9, textValue: "80", title: "Fool"),
        DataEntry(color: UIColor.orange, height: 0.5, textValue: "50", title: "Freak"),
        DataEntry(color: UIColor.purple, height: 0.5, textValue: "50", title: "Shit"),
        DataEntry(color: UIColor.blue, height: 0.2, textValue: "13", title: "Whore"),
        DataEntry(color: UIColor.brown, height: 0.7, textValue: "70", title: "Fuck"),
        DataEntry(color: UIColor.red, height: 0.2, textValue: "13", title: "Bitch"),
        DataEntry(color: UIColor.green, height: 0.4, textValue: "26", title: "Bullshit")
    ]
}
