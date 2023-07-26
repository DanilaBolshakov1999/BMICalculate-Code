//
//  ResultViewController.swift
//  BMICalculate-Code
//
//  Created by IOS - Developer  on 26.07.2023.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - UI
    private lazy var backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "result_background")
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 80, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descrLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recalculateButton = UIButton(isBackgroundWhite: true)
    
    //MARK: - Stack
    private lazy var mainStackView = UIStackView()
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = .blue
        setViews()
        setupConstrains()
    }
    
    //MARK: - setViews()
    private func setViews() {
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subView: [
                titleLabel,
                resultLabel,
                descrLabel
            ])
        
        view.addSubview(backgroundView)
        view.addSubview(mainStackView)
        view.addSubview(recalculateButton)
        
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19,5"
        descrLabel.text = "EAT SOME MORE SNACKS"
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        
    }
    @objc private func recalculateButtonTapped() {
        print("Tap recover")
    }
}

extension ResultViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 51),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
