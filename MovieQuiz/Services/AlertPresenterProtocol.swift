import UIKit

protocol AlertPresenterProtocol {
    func show(quiz alert: QuizResultsViewModel, completion: ((UIAlertAction) -> Void)?)
}
