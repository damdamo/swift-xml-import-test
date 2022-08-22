import Foundation

class PnmlParser: NSObject, XMLParserDelegate {

  // DOES NOT WORK
  func loadPN(filePath: String) {
    print(Bundle.main)
    let xmlResponseData = Bundle.main.getFileData(filePath)
    let parser = XMLParser(data: xmlResponseData)
    parser.delegate = self
    parser.parse()
  }
  
  // WORK
  func loadPN(url: URL) {
    let parser = XMLParser(contentsOf: url)!
    parser.delegate = self
    parser.parse()
  }
  
  
  func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    // Some code
  }

  
  func parser(_ parser: XMLParser, foundCharacters string: String) {
    // Some code
  }

  
  func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    // Some code
  }

  func parserDidEndDocument(_ parser: XMLParser) {
    // Some code
  }
  
}


extension Bundle {
    func getFileData(_ file: String) -> Data {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        
        return data
    }
}
