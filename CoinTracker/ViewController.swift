//
//  ViewController.swift
//  CoinTracker
//
//  Created by Fredy Sanchez on 22/01/23.
//

import UIKit

class ViewController: UIViewController {

    private var titleLabel: UILabel!
    private var pickerView: UIPickerView!
    private var containerStackView: UIStackView!
    private var coinPriceContainer: UIView!
    private var priceLabel: UILabel!
    private var currencyLabel: UILabel!
    
    let coinPriceContainerHeight: Double = 80.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Background Color")
        setupContainerStackView()
        setupPickerView()
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "CoinTracker"
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
    }
    
    func setupConversionView() {
        coinPriceContainer = UIView()
        
        coinPriceContainer.backgroundColor = .tertiaryLabel
        coinPriceContainer.layer.cornerRadius = coinPriceContainerHeight * 0.5
        
        // Add horizontal stackview
        let coinPriceStackView = UIStackView()
        coinPriceContainer.addSubview(coinPriceStackView)
        
        coinPriceStackView.axis = .horizontal
        coinPriceStackView.alignment = .center
        coinPriceStackView.distribution = .fill
        coinPriceStackView.spacing = 10
        
        let coinImage = UIImageView()
        coinImage.image = UIImage(systemName: "bitcoinsign.circle.fill")
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinImage.widthAnchor.constraint(equalToConstant: 80),
            coinImage.heightAnchor.constraint(equalToConstant: coinPriceContainerHeight)
        ])
        
        coinPriceStackView.addArrangedSubview(coinImage)
        
        setupPriceLabel()
        coinPriceStackView.addArrangedSubview(priceLabel)
        
        setupCurrencyLabel()
        coinPriceStackView.addArrangedSubview(currencyLabel)
        
        coinPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinPriceStackView.leadingAnchor.constraint(equalTo: coinPriceContainer.leadingAnchor),
            coinPriceStackView.trailingAnchor.constraint(equalTo: coinPriceContainer.trailingAnchor, constant: -20),
        ])
    }
    
    func setupPriceLabel() {
        priceLabel = UILabel()
        priceLabel.text = "..."
        priceLabel.font = UIFont.systemFont(ofSize: 25)
        priceLabel.textAlignment = .right
        priceLabel.textColor = .white
    }
    
    func setupCurrencyLabel() {
        currencyLabel = UILabel()
        currencyLabel.text = "USD"
        currencyLabel.font = UIFont.systemFont(ofSize: 25)
        currencyLabel.textColor = .white
    }
    
    func setupContainerStackView() {
        containerStackView = UIStackView()
        view.addSubview(containerStackView)
        
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        containerStackView.distribution = .fill
        containerStackView.spacing = 25
        
        setupTitleLabel()
        containerStackView.addArrangedSubview(titleLabel)
        
        setupConversionView()
        containerStackView.addArrangedSubview(coinPriceContainer)
        setCoinPriceContainerConstraints()
        
        setContainerStackViewConstraints()
    }
    
    func setupPickerView() {
        pickerView = UIPickerView()
        self.view.addSubview(pickerView)
        setPickerViewConstraints()
    }
    
    func setCoinPriceContainerConstraints() {
        coinPriceContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinPriceContainer.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 20),
            coinPriceContainer.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -20),
            coinPriceContainer.heightAnchor.constraint(equalToConstant: coinPriceContainerHeight)
        ])
    }
    
    func setContainerStackViewConstraints() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func setPickerViewConstraints() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 216)
        ])
    }
}

