class TestClass {
    
    -- Attribute with no initialization
    attribute_no_init : Int;
    
    -- Attribute with initialization
    attribute_with_init : String <- "Hello";

    -- Method with no parameters
    method_no_params() : Int {
        42
    };
    
    -- Method with one parameter
    method_one_param(param : String) : String {
        param.concat(" World!")
    };
    
    -- Method with multiple parameters
    method_multiple_params(param1 : Int, param2 : Int, param3 : Int) : Int {
        param1 + param2 + param3
    };
    
    -- Method with optional initialization
    method_with_init(param : Int) : Int {
        param * 2
    };
    
    -- Nested methods calling each other
    method_nested_calls() : String {
        method_one_param("Nested").concat(" Calls")
    };
    
    -- Using let bindings in a method
    method_let_binding_test() : Int {
        let x : Int <- 5, y : Int <- x + 3 in
        x + y
    };

    -- Test a case statement with formals
    method_case_test(param : Int) : Int {
        let x : Int <- 0 in (
            let y: Int <- 1 in (
                let z: Int <- 2 in (
                    case param of
                        x : Int => 1;
                        y : Int => 2;
                        z : Int => 3;
                    esac
                )
            )
        )
    };
    
    -- Method with a complex expression and feature interaction
    complex_method(param1 : Int, param2 : Int) : Int {
        if param1 < param2 then
            method_multiple_params(param1, param2, param1 + param2)
        else
            param1 - param2
        fi
    };

};
