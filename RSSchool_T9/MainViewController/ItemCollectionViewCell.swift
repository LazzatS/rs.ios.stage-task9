//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    private let coverImageView: UIImageView = {
        let coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFill
        coverImage.layer.cornerRadius = 10
        coverImage.layer.borderWidth = 1
        coverImage.clipsToBounds = true
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        return coverImage
    }()
    
    private let coverTitleView: UILabel = {
        let coverTitle = UILabel()
        coverTitle.textColor = .white
        coverTitle.font = UIFont(name: "Rockwell", size: 16)
        coverTitle.numberOfLines = 0
        coverTitle.translatesAutoresizingMaskIntoConstraints = false
        return coverTitle
    }()
    
    private let coverTypeView: UILabel = {
        let coverType = UILabel()
        coverType.textColor = UIColor(named: "CustomGrayText")
        coverType.font = UIFont(name: "Rockwell", size: 12)
        coverType.translatesAutoresizingMaskIntoConstraints = false
        return coverType
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = UIColor(named: "CustomWhiteGray")
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(coverTitleView)
        contentView.addSubview(coverTypeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) does not work" )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCoverImageLayout()
        setupTitleLayout()
        setupTypeLayout()
    }
    
    public func configure(with coverImage: UIImage, coverTitle: String, coverType: String) {
        coverImageView.image = coverImage
        coverTitleView.text = coverTitle
        coverTypeView.text = coverType
    }
    
    private func setupCoverImageLayout() {
        coverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        coverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        coverImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
    }
    
    private func setupTitleLayout() {
        coverTitleView.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: -30).isActive = true
        coverTitleView.leftAnchor.constraint(equalTo: coverImageView.leftAnchor, constant: 10).isActive = true
        coverTitleView.rightAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: -15).isActive = true
        coverTitleView.bottomAnchor.constraint(equalTo: coverTypeView.topAnchor, constant: -3).isActive = true
    }
    
    private func setupTypeLayout() {
        coverTypeView.topAnchor.constraint(equalTo: coverTitleView.bottomAnchor, constant: 3).isActive = true
        coverTypeView.leftAnchor.constraint(equalTo: coverImageView.leftAnchor, constant: 10).isActive = true
    }
}
