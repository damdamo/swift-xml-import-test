import XCTest
@testable import swift_xml_import_test

final class swift_xml_import_testTests: XCTestCase {
  
  func testWork() {
    let p = PnmlParser()
    if let url = URL(string: "https://www.pnml.org/version-2009/examples/philo.pnml") {
      p.loadPN(url: url)
    }
  }
  
  func testDoesNotWork() {
    let p = PnmlParser()
    p.loadPN(filePath: "dataTests.xml")
  }
}
