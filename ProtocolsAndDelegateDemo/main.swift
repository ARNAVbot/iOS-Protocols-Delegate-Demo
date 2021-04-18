protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation() {
        print("Can u tell me what happened ?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    
    // the following input needs to be passed when declaring a new object of this class
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per seconds")
    }
    
}

class Doctor : AdvanceLifeSupport {
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor knows what to do")
    }
    
    func useSethescope() {
        print("Listening for heart sounds")
    }
    
}

// this sub class automatically inherits the AdvanceLifeSupport functionality from its parent class
class Surgeon : Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings some soothing sounds")
    }
    
    func useElectricDrill() {
        print("Whirrr.....")
    }
}


let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

let angelia = Surgeon(handler: emilio)
emilio.medicalEmergency()
