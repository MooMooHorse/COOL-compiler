class Main {
    main() : Int {
        {
            let x:Int <- 1, z: Int <- 999 in {
                for (x:Int <- 1, y:Int <- 1; x <= 10; x <- x + 1) {
                    z <- z + 1
                };
                ~z;
            };
        }
    };
};