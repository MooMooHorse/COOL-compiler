class Toy {
    play(x: Int, y:Int) : Int {
        x + y
    };
};

class Bear inherits Toy {
    head: Int <- 1;
    feet: Int <- 2;
    undetermined: Int;
    eat(x: Int, y:Int) : Int {
        head + x + y
    };
};

class Main {
    main() : Int {
        {
            let toy: Toy <- new Toy in toy.play(5, 4);
            3;
        }
    };
};