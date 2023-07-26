//
//  ViewController.swift
//  BMICalculate-Code
//
//  Created by Danila Bolshakov  on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI
    private lazy var backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "calculate_background")
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    //MARK: - Stack
    private lazy var stackView = UIStackView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    private func setViews() {
        stackView = UIStackView(
            axis: .horizontal,
            distribution: .fillProportionally,
            subView: [])
        view.addSubview(backgroundView)
    }
}

extension ViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subView: [UIView] ) {
        self.init(arrangedSubviews: subView)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
