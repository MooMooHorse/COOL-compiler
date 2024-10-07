class Main {
    main() : Int {
        let x : Int <- 3, y : Int <- 2 in {
            y <- x + x <- x + y;
            y <- x + y;
            
        }
    };
};