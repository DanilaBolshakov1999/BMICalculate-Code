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
    private lazy var heightTitleView = UILabel(textAlignment: .left)
    private lazy var heightNumberView = UILabel(textAlignment: .right)
    private lazy var heighSlider = UISlider(maxValue: 3)
    
    private lazy var weightStackView = UIStackView()
    private lazy var weightTitleView = UILabel(textAlignment: .left)
    private lazy var weightNumberView = UILabel(textAlignment: .right)
    private lazy var weightSlider = UISlider(maxValue: 3)
    
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
            subView: [heightTitleView, heightNumberView])
        
        weightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subView: [weightTitleView, weightNumberView])
        
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
        
        heightTitleView.text = "Hight"
        heightNumberView.text = "1.5 m"
        
        weightTitleView.text = "Wight"
        weightNumberView.text = "100 kg"
        
        calculateButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
    }
    @objc func buttonTapped() {
        let resultVC = ResultViewController()
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

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subView: [UIView] ) {
        self.init(arrangedSubviews: subView)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(textAlignment: NSTextAlignment) {
        self.init()
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.text = text
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        self.maximumValue = 3
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(isBackgroundWhite: Bool) {
        self.init(type: .system)
        let color = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.0)
        let text = isBackgroundWhite ? "RECALCULATE" : "CALCULATE"
        
        self.tintColor = isBackgroundWhite ? color : .white
        self.backgroundColor = isBackgroundWhite ? .white : color
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.setTitle(text, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
