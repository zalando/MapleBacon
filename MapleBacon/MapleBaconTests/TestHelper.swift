//
//  Copyright © 2017 Jan Gorman. All rights reserved.
//

import Foundation
import Hippolyte

final class TestHelper {
  
  func testImage() -> UIImage {
    return UIImage(named: "MapleBacon", in: Bundle(for: type(of: self).self), compatibleWith: nil)!
  }
  
  func request(url: URL, response: StubResponse) -> StubRequest {
    return StubRequest.Builder()
      .stubRequest(withMethod: .GET, url: url)
      .addResponse(response)
      .build()
  }
  
  func imageResponse() -> StubResponse {
    return StubResponse.Builder()
      .stubResponse(withStatusCode: 200)
      .addBody(UIImagePNGRepresentation(testImage())!)
      .addHeader(withKey: "Content-Type", value: "image/png")
      .build()
  }
  
}
