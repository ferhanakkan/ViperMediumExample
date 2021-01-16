//
//  LocationViewController.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit

class LocationViewController: UIViewController {
    
    var presenter: LocationPresenterProtocol!
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hava Durumunu Goster", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear()
    }

    private func layout() {
        view.backgroundColor = .white
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        presenter.showWeatherButtonPressed()
    }
}

//MARK: Protocols

extension LocationViewController: LocationViewProtocol {
    func showWeaterButton() {
        button.isHidden = false
    }
}
