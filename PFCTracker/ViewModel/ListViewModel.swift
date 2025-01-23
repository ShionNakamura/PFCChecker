import Foundation

class ListViewModel: ObservableObject {
    
    @Published var gender: Bool = false {
        didSet { saveData() }
    }
    @Published var weight: Double = 50 {
        didSet { saveData() }
    }
    @Published var height: Double = 150 {
        didSet { saveData() }
    }
    @Published var age: Double = 20 {
        didSet { saveData() }
    }
    @Published var activePersonOrNot: Bool = false {
        didSet { saveData() }
    }
    @Published var bulkingOrDiet: Bool = false {
        didSet { saveData() }
    }  // false = diet, true = bulk
    @Published var maintainWeight: Bool = false {
        didSet { saveData() }
    }  // false = not maintain, true = maintain
    @Published var activeFactor: Double = 1.2 {
        didSet { saveData() }
    }  // Default: Sedentary
    @Published var frequencyWorkout: String = "" {
        didSet { saveData() }
    }
    @Published var goal: String = "" {
        didSet { saveData() }
    }

    init() {
        loadData()  // Load data when the app starts
    }
    
    // Load saved data from UserDefaults
    private func loadData() {
        gender = UserDefaults.standard.bool(forKey: "gender")
        weight = UserDefaults.standard.double(forKey: "weight") != 0 ? UserDefaults.standard.double(forKey: "weight") : 50
        height = UserDefaults.standard.double(forKey: "height") != 0 ? UserDefaults.standard.double(forKey: "height") : 150
        age = UserDefaults.standard.double(forKey: "age") != 0 ? UserDefaults.standard.double(forKey: "age") : 20
        activePersonOrNot = UserDefaults.standard.bool(forKey: "activePersonOrNot")
        bulkingOrDiet = UserDefaults.standard.bool(forKey: "bulkingOrDiet")
        maintainWeight = UserDefaults.standard.bool(forKey: "maintainWeight")
        activeFactor = UserDefaults.standard.double(forKey: "activeFactor") != 0 ? UserDefaults.standard.double(forKey: "activeFactor") : 1.2
        frequencyWorkout = UserDefaults.standard.string(forKey: "frequencyWorkout") ?? ""
        goal = UserDefaults.standard.string(forKey: "goal") ?? ""
        
        // Debug log
        print("Loaded data: gender = \(gender), weight = \(weight), height = \(height), age = \(age), activeFactor = \(activeFactor)")
    }

    // Save data to UserDefaults when any property changes
    private func saveData() {
        UserDefaults.standard.set(gender, forKey: "gender")
        UserDefaults.standard.set(weight, forKey: "weight")
        UserDefaults.standard.set(height, forKey: "height")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(activePersonOrNot, forKey: "activePersonOrNot")
        UserDefaults.standard.set(bulkingOrDiet, forKey: "bulkingOrDiet")
        UserDefaults.standard.set(maintainWeight, forKey: "maintainWeight")
        UserDefaults.standard.set(activeFactor, forKey: "activeFactor")
        UserDefaults.standard.set(frequencyWorkout, forKey: "frequencyWorkout")
        UserDefaults.standard.set(goal, forKey: "goal")
        
        // Debug log
        print("Saving data: gender = \(gender), weight = \(weight), height = \(height), age = \(age), activeFactor = \(activeFactor)")
    }
    
    // Reset data
    func resetData() {
        gender = false
        weight = 50
        height = 150
        age = 20
        activePersonOrNot = false
        bulkingOrDiet = false
        maintainWeight = false
        activeFactor = 1.2
        frequencyWorkout = ""
        goal = ""
        saveData()  // Save the reset data
        
        // Debug log
        print("Reset data: gender = \(gender), weight = \(weight), height = \(height), age = \(age), activeFactor = \(activeFactor)")
    }

    // Calculation functions (same as before)
    func BMRCalc() -> Double {
        if gender {
            return (10 * weight) + (6.25 * height) - (5 * age) + 5
        } else {
            return (10 * weight) + (6.25 * height) - (5 * age) - 161
        }
    }
    
    func TDEECalc() -> Double {
        return BMRCalc() * activeFactor
    }
    
    func proteinCalc() -> Double {
        return weight * 2  // Grams per kg body weight
    }
    
    func calcCalories() -> Double {
        return TDEECalc() * (bulkingOrDiet ? 1.2 : 0.8)  // Example adjustment for bulk/diet
    }
    
    func fatCalc() -> Double {
        return (calcCalories() * 0.2) / 9  // 20% of calories from fat, 9 kcal per gram
    }
    
    func carboCalc() -> Double {
        let totalCalories = maintainWeight ? TDEECalc() : calcCalories()
        return (totalCalories - ((proteinCalc() * 4) + (fatCalc() * 9))) / 4  // 4 kcal per gram of carbs
    }
}
