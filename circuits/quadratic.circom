pragma circom 2.0.0; // The circom compiler version

// Simple function to square a value
function sqr(x) { 
    return x*x;
}

// The main component for the circuit
// This checks that the input (x) does indeed solve the equation
// x^2 + x + 5 = 11
// Answer: x = 2
template Quadratic () {
    // input x (private by default)
    signal input x;
    // output, the right side of the equals sign
    signal output right;

    // Square x for x^2
    var first = sqr(x);
    // x for x
    var second = x;
    // 5 for 5
    var third = 5;
    // Add them all together to get the right side of the equation
    var sum = first + second + third;
    // Assign the right side of the equation to the output signal
    // <== is an assignment + constraint
    right <== sum;
    // Constrain the right to be 11
    // === is a constraint
    right === 11;
}

// Entry point into the circuit
component main = Quadratic();