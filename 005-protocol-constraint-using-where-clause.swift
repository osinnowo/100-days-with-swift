import Foundation

class UIViewController {
    func showAlert() -> Void {
        print("Showing alert...")
    }
    
    func dismissAlert() -> Void {
        print("Dismissing alert...")
    }
}

protocol BaseController where Self: UIViewController { }

extension BaseController {
    func alertState(state: Bool) {
        if state {
            showAlert()
        } else {
            dismissAlert()
        }
    }
}

class AuthController: UIViewController, BaseController {
    func login() {
        //TODO: Start Login
        alertState(state: true)
        
        
        //TODO: End Login
        alertState(state: false)
    }
}
