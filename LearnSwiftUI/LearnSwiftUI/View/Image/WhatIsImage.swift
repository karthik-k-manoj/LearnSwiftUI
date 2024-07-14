//
//  WhatIsImage.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 13/07/24.
//

import SwiftUI

/* By default image view reports a static value. The size of the
 the underlying image. Once we call `resizable()` on an image, it
 makes the view completely flexible. Then image will accept any
 proposed size, report it back and sequeeze that image into the size.
 In practice virtually any resizable image will be combined with
 an `aspectRatio(contentMode:) or `.scaleToFit()` modifier to prevent
 the image from distorted
 */


struct WhatIsImage: View {
    var body: some View {
       Image("myImage")
            .resizable()
            // A parent (modifier) can ask it's child multiple times before it returns from here.
            // So Aspect Ratio will ask size by giving nil x nil to get the it's ideal size
            // then do some modification to and proposes new size which the view might accept and returns.
            // Aspect Ratio will return the modifed size
            // The parent is asking aspect ratio what is your size? Aspect ratio has a child. It consults with the child to get the it's size
            // and that is the size of the aspect ratio.
            .aspectRatio( contentMode: .fit)
    }
}

struct WhatIsImage_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsImage()
    }
}

