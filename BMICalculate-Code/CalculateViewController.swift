//
//  ViewController.swift
//  BMICalculate-Code
//
//  Created by Danila Bolshakov  on 26.07.2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
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
    
    private lazy var calculateButton = UIButton(isBackgroundWhite: false)
    
    //MARK: - Stack
    private lazy var mainStackView = UIStackView()
    
    private lazy var heightStackView = UIStackView()
    private lazy var heightTitleLabel = UILabel(textAlignment: .left)
    private lazy var heightNumberLabel = UILabel(textAlignment: .right)
    private lazy var heighSlider = UISlider(maxValue: 3)
    
    private lazy var weightStackView = UIStackView()
    private lazy var weightTitleLabel = UILabel(textAlignment: .left)
    private lazy var weightNumberLabel = UILabel(textAlignment: .right)
    private lazy var weightSlider = UISlider(maxValue: 300)
    
    //MARK: - Private Properties
    var calculatorBrain = CalculateBrain()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    //MARK: - setViews()
    private func setViews() {
        
        
        
        heightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subView: [heightTitleLabel, heightNumberLabel])
        
        weightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subView: [weightTitleLabel, weightNumberLabel])
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subView: [
                titleLabel,
                heightStackView,
                heighSlider,
                weightStackView,
                weightSlider,
                calculateButton
            ])
        
        view.addSubview(backgroundView)
        view.addSubview(mainStackView)
        
        titleLabel.text = "CALCULATE YOU BMI"
        
        heightTitleLabel.text = "Hight"
        heightNumberLabel.text = "1.5 m"
        
        weightTitleLabel.text = "Wight"
        weightNumberLabel.text = "100 kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        heighSlider.addTarget(self, action: #selector(heightSliderChange), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChange), for: .valueChanged)
    }
    
    @objc private func heightSliderChange(_ sender: UISlider) {
        heightNumberLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @objc private func weightSliderChange(_ sender: UISlider) {
        weightNumberLabel.text = String(format: "%.1f", sender.value) + "Kg"
    }
    
    @objc func calculateButtonTapped() {
        
        let height = heighSlider.value
        let weight = weightSlider.value

        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
    
        present(resultVC, animated: true)
    }
}

extension CalculateViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 21),
            heighSlider.heightAnchor.constraint(equalToConstant: 60),
            
            weightStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}
