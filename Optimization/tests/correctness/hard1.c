int m[10];
/**
 * meminstr alias with meminstr
 */
int main() {
    m[0] = 20;
    m[1] = 30;
    m[2] = m[0] + m[1];
    m[3] = m[0] - m[1];
    m[4] = m[2] * m[2];

    int* p = &m[0];

    // p  has alias to m[0] and m[1]

    while(m[0] < m[2]) {  
        // increment m[0] and m[1] interchangeably
        if(m[0] & 1) {
            (*p)++; // m[1] ++;
            p--;
        } else { // m[0] ++;
            (*p)++;
            p++; // change p from &m[0] to &m[1]
        }

        m[5] = m [1]; // a variable instead of a constant


        if(m[0] + m[1] < m[2] ) {
            m[3] = m[0] - m[1];
        } else {
            m[3] = m[0] * m[1];
        }

        m[4] = m[2] * m[2];
    }

    return m[5]; // this should not be 30
}

// mem2reg pass -> all m[i] -> variables 
