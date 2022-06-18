//
//  GradientDescent.swift
//  KanaKana
//
//  Created by Johannes Brands on 15/06/2021.
//

import Accelerate
import simd

typealias Matrix = matrix_double2x2
typealias Vector = vector_double2
typealias Scalar = simd_double1

class GradientDescent {
    
    func evaluate(with parameters: Vector) -> Vector {
//        let gamma = parameters[0]
//        let delta = parameters[1]
        let dGamma = parameters[0]
        let dDelta = parameters[1]
//        let LL = delta + gamma
//        let contributions
//        LL = contributions.reduce { + }
        return [dGamma,dDelta]
    }

    func evaluate2(with parameters: Vector) -> Vector {
        // f(x,y) = -(x-1)^2 - (y-1)^2
        // dx = -2(x-1)
        // dy = -2(y-1)
        // minimum is at f(-1, -1)

        let dx = -2*(parameters[0]-1)
        let dy = -2*(parameters[1]-1)
        return [dx, dy]
    }
/*
Hi+1 = Hi
        + (xi+1 − xi) ⊗ (xi+1 − xi) / (xi+1 − xi) · (∇fi+1 − ∇fi)
        − [Hi · (∇fi+1 − ∇fi)] ⊗ [Hi · (∇fi+1 − ∇fi)] / (∇fi+1 − ∇fi) · Hi · (∇fi+1 − ∇fi)
        + [(∇fi+1 − ∇fi) · Hi · (∇fi+1 − ∇fi)] u ⊗ u

u = (xi+1 − xi) / (xi+1 − xi) · (∇fi+1 − ∇fi)
    − Hi · (∇fi+1 − ∇fi) / (∇fi+1 − ∇fi) · Hi · (∇fi+1 − ∇fi)

curvature = curvature
        + step ⊗ step / step · drift
        − (curvature * drift) ⊗ (curvature * drift) / drift · curvature * drift
        + (drift · curvature * drift) * u ⊗ u
u = ( step / step · drift ) − ( curvature · drift ) / ( drift · curvature * drift )

inner product aTa   U+2219    ∙
outer product aaT   U+2297    ⊗
cross product       U+2a2f    ⨯
usual product                 *
*/
    func maximum() -> Vector? {
        let maxIterations = 100
        let tolerance = 0.01

        // set starting values
        var parameters: Vector = .zero
        var gradient: Vector = evaluate(with: parameters)
        var curvature: Matrix = matrix_identity_double2x2

        for _ in 0 ..< maxIterations {
            let direction: Vector = curvature * gradient

            // adapt the step size to the curvature https://arxiv.org/pdf/1612.06965.pdf
            let d: Scalar = sqrt(direction ∙ curvature.inverse * direction )
            let r: Scalar = gradient ∙ direction
            let stride = r / (r + d) * d

            // calculate the gradient at the new point
            let step = stride * direction
            parameters = parameters + step
            let newGradient = evaluate(with: parameters)

            //
            if length(newGradient) < tolerance { return parameters }

            //update the curvature according to the BFGS algorithm
            let drift = newGradient - gradient

            // https://www.cec.uchile.cl/cinetica/pcordero/MC_libros/NumericalRecipesinC.pdf page 425
            let sd:  Scalar = step ∙ drift
            let cd:  Vector = curvature * drift
            let dcd: Scalar = drift ∙ cd
            let u:   Vector = step/sd - cd/dcd

            curvature = curvature
                    + step ⊗ step / sd
                    - cd ⊗ cd / dcd
                    + dcd * u ⊗ u

//            let U:  Matrix = ( 1/sd*sd ) * (sd + dcd) * step ⊗ step
//            let V:  Matrix = ( 1/sd ) * (curvature * drift ∙ step + step ∙ drift * curvature)
//            curvature = curvature + U - V

            gradient = newGradient
        }
        return nil
    }

}

// M * V = V                v = simd_mul(m, v)
// VT * V = V ∙ V = S       s = simd_dot(v, v)

precedencegroup VectorProductOperatorPrecedence {
lowerThan: MultiplicationPrecedence
higherThan: AdditionPrecedence
associativity: left
assignment: false
}

infix operator ∙ : VectorProductOperatorPrecedence
func ∙ (lhs: Vector, rhs: Vector) -> Scalar {
    return dot(lhs, rhs)
}

infix operator ⊗ : VectorProductOperatorPrecedence
func ⊗ (lhs: Vector, rhs: Vector) -> Matrix {
    let s = matrix_double2x2(lhs, lhs)
    let r = matrix_double2x2(diagonal: rhs)
    return simd_mul(s, r)
}
