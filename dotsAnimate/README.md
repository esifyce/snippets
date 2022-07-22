<H1>USE ONLY DotsAnimation.swift, 1 file!!!! </H1>

// Property
    var dots = ProgressDotsHud.shared
    
// View
   view.addSubview(dots)
 
 // Show/Hide
        dots.animation.stopHud(dots: dots)
        dots.animation.startHud(dots: dots)
        dots.animation.stopHud(dots: dots)
        dots.animation.startHud(dots: dots)
    
