import Foundation

/* You can modify the ball example */

/* Singleon example from OOP slides */
class Ball {
    private static var instance: Ball?
    private var color: String?

    private init(_ color: String) {
        self.color = color
    }
    
    /* fetching that instance of the ball if there is one*/
    public static func getInstance(_ color: String) -> Ball? {
        if (instance == nil) {
            self.instance = Ball(color)
        }
        return instance
    }

    /* should only be called if there is an instance available */
    public func bounce() {
        if let color = self.color {
            print("The \(color) ball is bouncing")
        }
    }
}


func main() {
    let instance: Ball? = Ball.getInstance("blue")
    instance!.bounce()
}
main()
