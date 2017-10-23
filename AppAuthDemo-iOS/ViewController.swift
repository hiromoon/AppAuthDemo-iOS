import UIKit
import AppAuth

class ViewController: UIViewController {
    let issuer = URL(string:"https://accounts.google.com")!
    let kClientId = "999999999999-xxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com"
    let kRedirectURI = URL(string:"com.googleusercontent.apps.999999999999-xxxxxxxxxxxxxxxxxxxxx://")!
    var kConfig: OIDServiceConfiguration?
    var authState: OIDAuthState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer, completion: {(configuration, err) in
            if let error = err {
                print("err")
                print(error);
                return
            }
            self.kConfig = configuration
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var Text1: UITextView!
    @IBAction func onClick(_ sender: Any) {
        let request = OIDAuthorizationRequest(configuration: kConfig!,
                                              clientId: kClientId,
                                              clientSecret: nil,
                                              scopes: ["openid", "profile"],
                                              redirectURL: kRedirectURI,
                                              responseType: "code",
                                              additionalParameters: nil)
        let app = UIApplication.shared.delegate as! AppDelegate
        app.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, presenting: self, callback: { (state, err) in
            if let error = err {
                print("err")
                print(error)
                return
            }
            self.authState = state!
            let at = state!.lastTokenResponse!.accessToken!
            self.Text1.text = at
        })
    }
    
    @IBAction func getUserInfoRequest(_ sender: Any) {
        self.Text1.text = "getUserInfo"
    }
    @IBAction func refreshTokenRequest(_ sender: Any) {
        self.authState!.setNeedsTokenRefresh()
        self.authState!.performAction { (accessToken, idToken, err) in
            if let error = err {
                print("err")
                print(error)
                return
            }
            self.Text1.text = "accessToken: " + accessToken! + "\nidToken: " + idToken!
        }
    }
    
}

