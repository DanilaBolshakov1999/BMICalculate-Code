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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Stack
    private lazy var mainStackView = UIStackView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    private func setViews() {
        mainStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillProportionally,
            subView: [titleLabel]
        )
        
        view.addSubview(backgroundView)
        view.addSubview(mainStackView)
        titleLabel.text = "CALCULATE YOU BMI"
    
        
    }
}


extension ViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
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

