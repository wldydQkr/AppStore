//
//  TodayCollectionViewCell.swift
//  AppStore
//
//  Created by 박지용 on 2022/04/15.
//

import UIKit
import SnapKit
import Kingfisher // imageURL을 imageView에 설정해주면 자동으로 인터넷 서버에서 이미지를 표시시켜주는 오픈소스 라이브러리

final class TodayCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // imageView의 크기보다 image가 크면 image가 imageView의 크기보다 벗어나서 표시가 됨
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(today: Today) {
        setupSubViews()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        subTitleLabel.text = today.subTitle
        descriptionLabel.text = today.description
        titleLabel.text = today.title
        
        if let imageURl = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURl)
        }
        
    }
}

private extension TodayCollectionViewCell { // Layout 설정
    func setupSubViews() {
        [imageView, titleLabel, subTitleLabel, descriptionLabel]
            .forEach { addSubview($0) }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel)
            $0.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(24.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview().inset(24.0)
        }
        
        imageView.snp.makeConstraints { // cell의 사이즈와 똑같이
            $0.edges.equalToSuperview()
        }
    }
}
