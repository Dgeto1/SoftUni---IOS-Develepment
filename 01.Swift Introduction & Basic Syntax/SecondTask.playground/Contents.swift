import UIKit

func SurfaceAndPerimeterOfCircle(radius: Float) -> (surface: Float, perimeter: Float){
    let surface = .pi * radius*radius
    let perimeter = .pi*radius*2;
    return (surface, perimeter)
    
}

print (SurfaceAndPerimeterOfCircle(radius: 5))
