
// MARK: - Загрузка представления View Controller из файла XIB
public extension UIViewController {

    func viewFromNib() -> UIView {
        let name = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            fatalError("Nib not found.")
        }
        return view
    }
}

class ViewController: UIViewController {

    // ...
    
    override func loadView() {
        self.view = viewFromNib()
    }
    
    // ...
  
}

// MARK: - Загрузка пользовательского подкласса UIView из файла XIB

extension UIView {

    func loadFromNib() {
        let name = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            fatalError("Nib not found.")
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layoutAttachViewToSuperview(view: view)
    }

    func layoutAttachViewToSuperview(view: UIView) {
        let views = ["view" : view]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views)
        addConstraints(horizontalConstraints + verticalConstraints)
    }
}

class View: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
}
