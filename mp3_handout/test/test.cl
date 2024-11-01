class Toy {
    play(x: Int, y:Int) : Int {
        x + y
    };
};

class Bear inherits Toy {
    eat(x: Int, y:Int) : Int {
        x + y
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