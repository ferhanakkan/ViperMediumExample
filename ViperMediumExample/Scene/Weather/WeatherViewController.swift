//
//  WeatherViewController.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var presenter: WeatherPresenterProtocol!

    let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        presenter.viewDidApperar()
    }
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

//MARK: Protocols

extension WeatherViewController: WeatherViewProtocol {
    func updateLabel(text: String) {
        label.text = text + " Derece"
    }
}
