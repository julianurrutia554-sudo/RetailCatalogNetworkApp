//
//  ProductDetailViewController.swift
//  RetailCatalog
//
//  Created by Julian Urrutia on 29/05/26.
//

import UIKit
import Kingfisher

final class ProductDetailViewController: UIViewController {
    private let viewModel: ProductDetailViewModel

    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var productImageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var badgeLabel = UILabel()

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(badgeLabel)

        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 12

        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.numberOfLines = 0

        priceLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        priceLabel.textColor = .systemGreen

        badgeLabel.textColor = .systemRed
        badgeLabel.font = .boldSystemFont(ofSize: 14)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 200),
            productImageView.heightAnchor.constraint(equalToConstant: 200),

            nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            badgeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            badgeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            badgeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            badgeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }

    private func configure() {
        title = viewModel.product.title
        nameLabel.text = viewModel.product.title
        priceLabel.text = viewModel.product.formattedPrice

        if let badge = viewModel.product.badgeText {
            badgeLabel.text = badge
            badgeLabel.isHidden = false
        } else {
            badgeLabel.isHidden = true
        }

        guard let url = URL(string: viewModel.product.imageUrl) else { return }
        productImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
    }
}
