class Main {
    main() : Int {
        let x : Int <- 3, y : Int <- 2 in {
            let x: Int <- 2 in 
                x + y
            ;
            let y: Int <- 2 in 
                x + y
            ;
        }
    };
};