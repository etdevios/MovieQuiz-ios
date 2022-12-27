import UIKit

protocol AlertPresenterProtocol {
    func showAlert(_ model: AlertModel, completion: ((UIAlertAction) -> Void)?)
}
