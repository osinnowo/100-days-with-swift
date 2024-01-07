extension String {
    var isBlank: Bool {
        return allSatisfy { $0.isWhitespace }
    }
}