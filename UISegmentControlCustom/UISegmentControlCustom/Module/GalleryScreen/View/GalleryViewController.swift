import UIKit

protocol GalleryViewControllerProtocol: AnyObject {
    
}

class GalleryViewController: UIViewController {
    
    // MARK: - Properrt
    
    private var tapSegment: ((UISegmentedControl) -> Void)
    private let presenter: GalleryPresenterProtocol?
    
    // MARK: - Views
    
    lazy var galleryView = GalleryView(frame: UIScreen.main.bounds,
                                               delegate: presenter as! GalleryViewDelegate)

    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            presenter?.viewDidLoad()
        }
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Appear")
        galleryView.selectedSegment(index: 1)
    }
    
    init(presenter: GalleryPresenterProtocol?, tapSegment: (@escaping (UISegmentedControl) -> Void)) {
        self.tapSegment = tapSegment
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryViewController {
    func configureUI() {
        view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
        addViews()
        addTargets()
        addConstraints()
        updateTexts()
        
        
    }
    
    func addViews() {
        [galleryView].forEach({
            self.view.addSubview($0)
        })
    }
    
    func addConstraints() {
        galleryView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            galleryView.topAnchor.constraint(equalTo: view.topAnchor),
            galleryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            galleryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func addTargets() {
        galleryView.segmentedControl.addTarget(self, action: #selector(didTapSegment), for: .valueChanged)
    }
    
    func updateTexts() {}
    
    @objc func didTapSegment(segment: UISegmentedControl) {
        tapSegment(segment)
    }
}
