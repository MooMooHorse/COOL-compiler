class B inherits A {
    -- dynamic dispatch (& associativity)
    -- new expression
    foo () : Int { (new B).bar().foo() };
  
    -- static dispatch
    bar () : A { 
      let y : Int  1 in (
        for (x : Int  1, y:Int <- 1; x < 10 ; x = x + 1) {
          x = x + 1
        } 
      )
      
    };
};

Class E inherits A {
    method_case_test(param : Int) : Int {
        let x : Int <- 0,  <- 1, z : Int <- 2 in (
            case param of
                x : => 1;
                y : Int => 2;
                z : Int => 3;
            esac
        )
    };
}
;