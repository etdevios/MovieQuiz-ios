import UIKit

struct AlertPresenter {
    
    weak var present: UIViewController?
    
    func show(_ model: AlertModel, completion: ((UIAlertAction) -> Void)? = nil) {
        
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
        present?.present(alert, animated: true)
    }
    
}
