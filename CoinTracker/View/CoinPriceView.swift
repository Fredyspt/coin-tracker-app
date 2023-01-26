//
//  CoinPriceComponent.swift
//  CoinTracker
//
//  Created by Fredy Sanchez on 24/01/23.
//

import UIKit

class CoinPriceView: UIView {
    
    var titleAndCoinPriceContainer: UIStackView = {
        let titleAndCoinPriceContainer = UIStackView()
        titleAndCoinPriceContainer.axis = .vertical
        titleAndCoinPriceContainer.alignment = .center
        titleAndCoinPriceContainer.distribution = .fill
        titleAndCoinPriceContainer.spacing = 25
        titleAndCoinPriceContainer.translatesAutoresizingMaskIntoConstraints = false
        return titleAndCoinPriceContainer
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "CoinTracker"
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        return titleLabel
    }()
    
    var coinPriceContainer: UIView = {
        let coinPriceContainer = UIView()
        coinPriceContainer.backgroundColor = .tertiaryLabel
        coinPriceContainer.layer.cornerRadius = 40
        coinPriceContainer.translatesAutoresizingMaskIntoConstraints = false
        return coinPriceContainer
    }()
    
    var coinPriceComponents: UIStackView = {
        let coinPriceStackView = UIStackView()
        coinPriceStackView.axis = .horizontal
        coinPriceStackView.alignment = .center
        coinPriceStackView.distribution = .fill
        coinPriceStackView.spacing = 10
        coinPriceStackView.translatesAutoresizingMaskIntoConstraints = false
        return coinPriceStackView
    }()
    
    var coinImage: UIImageView = {
        let coinImage = UIImageView()
        coinImage.image = UIImage(systemName: "bitcoinsign.circle.fill")
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        return coinImage
    }()
    
    var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "..."
        priceLabel.font = UIFont.systemFont(ofSize: 25)
        priceLabel.textAlignment = .right
        priceLabel.textColor = .white
        return priceLabel
    }()
    
    var currencyLabel: UILabel = {
        let currencyLabel = UILabel()
        currencyLabel.text = "USD"
        currencyLabel.font = UIFont.systemFont(ofSize: 25)
        currencyLabel.textColor = .white
        return currencyLabel
    }()
    
    var currencySelector: UIPickerView = {
        let currencySelector = UIPickerView()
        currencySelector.translatesAutoresizingMaskIntoConstraints = false
        return currencySelector
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupUI() {
        coinPriceComponents.addArrangedSubview(coinImage)
        coinPriceComponents.addArrangedSubview(priceLabel)
        coinPriceComponents.addArrangedSubview(currencyLabel)
        coinPriceContainer.addSubview(coinPriceComponents)
        titleAndCoinPriceContainer.addArrangedSubview(titleLabel)
        titleAndCoinPriceContainer.addArrangedSubview(coinPriceContainer)
        self.addSubview(titleAndCoinPriceContainer)
        self.addSubview(currencySelector)
        self.backgroundColor = UIColor(named: "Background Color")
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 260),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            coinPriceContainer.heightAnchor.constraint(equalToConstant: 80),
            coinPriceContainer.leadingAnchor.constraint(equalTo: titleAndCoinPriceContainer.leadingAnchor, constant: 20),
            coinPriceContainer.trailingAnchor.constraint(equalTo: titleAndCoinPriceContainer.trailingAnchor, constant: -20),
            coinPriceComponents.leadingAnchor.constraint(equalTo: coinPriceContainer.leadingAnchor),
            coinPriceComponents.trailingAnchor.constraint(equalTo: coinPriceContainer.trailingAnchor, constant: -20),
            coinImage.widthAnchor.constraint(equalToConstant: 80),
            coinImage.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            titleAndCoinPriceContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleAndCoinPriceContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleAndCoinPriceContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            currencySelector.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            currencySelector.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            currencySelector.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            currencySelector.heightAnchor.constraint(equalToConstant: 216)
        ])
    }
    
    func autoPinEdgesToSuperviewEdges() {
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        ])
    }
}
