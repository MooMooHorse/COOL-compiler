# Toy Tutorial (Augmented)

This contains sample code to support the tutorial on using MLIR for
building a compiler for a simple Toy language.

See [docs/Tutorials/Toy](../../docs/Tutorials/Toy) at the root of
the project for more informations.

## Augmented with `let` expression


The let expr has the following format
```
struct Struct{
    var x;
    var y;
}

def main() {
  # Define a variable `a` with shape <2, 3>, initialized with the literal value.
  # The shape is inferred from the supplied literal.
  var a = [[1, 2, 3], [4, 5, 6]];

  # b is identical to a, the literal tensor is implicitly reshaped: defining new
  # variables is the way to reshape tensors (element count must match).
  var b<2, 3> = [1, 2, 3, 4, 5, 6];

  let var c = a + b, var d = a + c {
    var e  = c + d;
    print(e);
  }

  # transpose() and print() are the only builtin, the following will transpose
  # a and b and perform an element-wise multiplication before printing the result.
  print(transpose(a) * transpose(b));
}
```

