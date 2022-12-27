import UIKit

struct AlertPresenter {
    
    private(set) weak var alertPresent: UIViewController?
    
    func showAlert(_ model: AlertModel) {
        
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default,
            handler: model.completion
        )
        
        alert.addAction(action)
        alert.view.accessibilityIdentifier = "Game results"
        alertPresent?.present(alert, animated: true)
    }
    
}
