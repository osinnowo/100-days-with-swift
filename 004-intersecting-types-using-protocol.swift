class Database {}

protocol Persistence {}

class Concrete: Database, Persistence {}

var database: Database & Persistence = Concrete()
