
(*
 *  execute "../reference-binaries/lexer bad.cl | ../reference-binaries/parser"
 *  to see the error messages that the reference parser generates
 *
 *  execute "./lexer bad.cl | ./parser" to see the error messages that your
 *  parser generates
 *)

(* no error *)
class A {
};

(* error:  b is not a type identifier *)
Class b inherits A {
};

(* error:  a is not a type identifier *)
Class C inherits a {
};

(* error:  keyword inherits is misspelled *)
Class D inherts A {
};

(* error:  closing brace is missing *)
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

(* error:  keyword inherits is misspelled *)
Class D inherts A {
};