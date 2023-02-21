//
//  CellModels.swift
//  NewsApp
//
//  Created by Krasivo on 04.02.2023.
//

import UIKit

protocol CellTypeProtocol {
    var cellsId: String { get }
    var general: CellGeneralPropertiesProtocol { get }
    var label: CellLabelPropertiesProtocol? { get }
    var sublabel: CellLabelPropertiesProtocol? { get }
    var separator: CellSeparatorPropertiesProtocol? { get }
    var image: CellImagePropertiesProtocol? { get }
    var deepLink: CellLabelPropertiesProtocol? { get }
    var datePublish: CellLabelPropertiesProtocol? { get }
    var sourcePublsh: CellLabelPropertiesProtocol? { get }
}

enum CellType {
    case spacerCell(general: CellGeneralPropertiesProtocol)
    case labelCell(general: CellGeneralPropertiesProtocol,
                   label: CellLabelPropertiesProtocol,
                   separator: CellSeparatorPropertiesProtocol)
    case newsMainCell(general: CellGeneralPropertiesProtocol,
                      image: CellImagePropertiesProtocol,
                      label: CellLabelPropertiesProtocol,
                      sublabel: CellLabelPropertiesProtocol,
                      separator: CellSeparatorPropertiesProtocol)
    case newsDetailCell(general: CellGeneralPropertiesProtocol,
                        image: CellImagePropertiesProtocol,
                        label: CellLabelPropertiesProtocol,
                        sublabel: CellLabelPropertiesProtocol,
                        datePublish: CellLabelPropertiesProtocol,
                        sourcePublsh: CellLabelPropertiesProtocol,
                        deepLink: CellLabelPropertiesProtocol)
}

extension CellType: CellTypeProtocol {
    
    var cellsId: String {
        switch self {
            case .spacerCell:
                return "SpacerCell"
            case .labelCell:
                return "LabelCell"
            case .newsMainCell:
                return "NewsMainCell"
            case .newsDetailCell:
                return "NewsDetailCell"
        }
    }
    
    var general: CellGeneralPropertiesProtocol {
        switch self {
            case .spacerCell(general: let general):
                return general
            case .labelCell(general: let general, label: _, separator: _):
                return general
            case .newsMainCell(general: let general, image: _, label: _, sublabel: _, separator: _):
                return general
            case .newsDetailCell(general: let general, image: _, label: _, sublabel: _, datePublish: _, sourcePublsh: _, deepLink: _):
                return general
        }
    }
    
    var label: CellLabelPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell(general: _, label: let label, separator: _):
                return label
            case .newsMainCell(general: _, image: _, label: let label, sublabel: _, separator: _):
                return label
            case .newsDetailCell(general: _, image: _, label: let label, sublabel: _, datePublish: _, sourcePublsh: _, deepLink: _):
                return label
        }
    }
    
    var separator: CellSeparatorPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell(general: _, label: _, separator: let separator):
                return separator
            case .newsMainCell(general: _, image: _, label: _, sublabel: _, separator: let separator):
                return separator
            case .newsDetailCell:
                return nil
        }
    }
    
    var sublabel: CellLabelPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell:
                return nil
            case .newsMainCell(general: _, image: _, label: _, sublabel: let sublabel, separator: _):
                return sublabel
            case .newsDetailCell(general: _, image: _, label: _, sublabel: let sublabel, datePublish: _, sourcePublsh: _, deepLink: _):
                return sublabel
        }
    }
    
    var image: CellImagePropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell:
                return nil
            case .newsMainCell(general: _, image: let image, label: _, sublabel: _, separator: _):
                return image
            case .newsDetailCell(general: _, image: let image, label: _, sublabel: _, datePublish: _, sourcePublsh: _, deepLink: _):
                return image
        }
    }
    
    var deepLink: CellLabelPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell:
                return nil
            case .newsMainCell:
                return nil
            case .newsDetailCell(general: _, image: _, label: _, sublabel: _, datePublish: _, sourcePublsh: _, deepLink: let deepLink):
                return deepLink
        }
    }
    
    var datePublish: CellLabelPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell:
                return nil
            case .newsMainCell:
                return nil
            case .newsDetailCell(general: _, image: _, label: _, sublabel: _, datePublish: let datePublish, sourcePublsh: _, deepLink: _):
                return datePublish
        }
    }
    
    var sourcePublsh: CellLabelPropertiesProtocol? {
        switch self {
            case .spacerCell:
                return nil
            case .labelCell:
                return nil
            case .newsMainCell:
                return nil
            case .newsDetailCell(general: _, image: _, label: _, sublabel: _, datePublish: _, sourcePublsh: let source, deepLink: _):
                return source
        }
    }
}

protocol CellGeneralPropertiesProtocol {
    var cellHeight: CGFloat { get }
    var cellBackgroundColor: UIColor { get }
    var tapAction: (() -> Void)? { get }
}

struct CellGeneralProperties: CellGeneralPropertiesProtocol {
    var cellHeight: CGFloat = 40
    var cellBackgroundColor: UIColor = .clear
    var tapAction: (() -> Void)?
}

protocol CellLabelPropertiesProtocol {
    var title: String { get }
    var titleColor: UIColor { get }
    var titleFont: UIFont { get }
    var numberOfLines: Int { get }
    var textAlignment: NSTextAlignment { get }
    var leadingConstraint: CGFloat? { get }
    var trailingConstraint: CGFloat? { get }
    var tapAction: ((_ url: String) -> Void)? { get }
}

struct CellLabelProperties: CellLabelPropertiesProtocol {
    var title: String = ""
    var titleColor: UIColor = .white
    var titleFont: UIFont = .systemFont(ofSize: 16)
    var numberOfLines: Int = 0
    var textAlignment: NSTextAlignment = .left
    var leadingConstraint: CGFloat?
    var trailingConstraint: CGFloat?
    var tapAction: ((_ url: String) -> Void)?
}

protocol CellSeparatorPropertiesProtocol {
    var isHidden: Bool { get }
    var backgroundColor: UIColor  { get }
    var backgroundColorAlfa: CGFloat { get }
}

struct CellSeparatorProperties: CellSeparatorPropertiesProtocol {
    var isHidden: Bool = false
    var backgroundColor: UIColor = .clear
    var backgroundColorAlfa: CGFloat = 1
}

protocol CellImagePropertiesProtocol {
    var image: String { get }
    var imageContentMode: UIView.ContentMode { get }
    var isRadio: Bool? { get }
}

struct CellImageProperties: CellImagePropertiesProtocol {
    var image: String = ""
    var imageContentMode: UIView.ContentMode = .scaleAspectFit
    var isRadio: Bool? = false
}
