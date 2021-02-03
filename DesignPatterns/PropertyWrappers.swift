import UIKit

/* Simple property wrapper that just capitalizes a string that gets placed into it */
@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

/* Creating another property wrapper that takes an integer and squares it */
@propertyWrapper struct Squared<T:FloatingPoint> {
    var wrappedValue: T {
        didSet { wrappedValue = wrappedValue * wrappedValue}
    }
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue * wrappedValue
    }
}
struct Number<T: FloatingPoint>{
    @Squared var x: T
}

func main() {
    
    /* Using the Capitalized wrappedValue */
    var user = User(firstName: "john", lastName: "appleseed")
    user.lastName = "sundell"
    print(user.firstName)
    
    /* Using the squared wrappedvalue */
    let two = Number(x: 2)
    let four = Number(x: 4.0)
    print(two.x)
    print(four.x)
}
main()


