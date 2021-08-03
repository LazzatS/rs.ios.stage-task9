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
        coverImage.clipsToBounds = true
        return coverImage
    }()
    
    private let coverTitleView: UILabel = {
        let coverTitle = UILabel()
        coverTitle.textColor = .white
        return coverTitle
    }()
    
    private let coverTypeView: UILabel = {
        let coverType = UILabel()
        coverType.textColor = .white
        return coverType
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(coverImageView)
        contentView.addSubview(coverTitleView)
        contentView.addSubview(coverTypeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) does not work" )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        coverImageView.frame = contentView.bounds
        coverTitleView.frame = contentView.bounds
        coverTypeView.frame = contentView.bounds
    }
    
    public func configure(with coverImage: UIImage, coverTitle: String, coverType: String) {
        coverImageView.image = coverImage
        coverTitleView.text = coverTitle
        coverTypeView.text = coverType
    }
}
