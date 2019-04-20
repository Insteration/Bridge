//
//  ViewController.swift
//  Bridge
//
//  Created by Artem Karmaz on 4/20/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Мост это структурный паттерн проектирования, который разделяет абстракцию и реализацию, позволяя изменять их независимо друг от друга. Простейший пример table view datasource
   
    @IBOutlet weak var dayPicker: DayPickerView!
    
    var days = ["Mn", "Ts", "Wd", "Tr", "Fr", "Sat", "Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker.dataSource = self // источник данных будет этот контроллер (дата сурс)
    }


}

extension ViewController: DayPickerViewDataSouce {
    func dayPickerCount(_ dayPickerCount: DayPickerView) -> Int {
        return days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return days[indexPath.row]
    }
    
    
}
