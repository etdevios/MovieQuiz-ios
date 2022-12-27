import UIKit

struct AlertPresenter: AlertPresenterProtocol {
    
    private weak var delegate: AlertDelegate?
    
    init(delegate: AlertDelegate? = nil) {
        self.delegate = delegate
    }
    
    func showAlert(_ model: AlertModel, completion: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default,
            handler: completion
        )
        
        alert.addAction(action)
        alert.view.accessibilityIdentifier = "Game results"
        delegate?.presentAlert(alert, animated: true)
    }
    
}
