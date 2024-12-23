int m[10];

// side-effect:
// change m[0], ...,m[4] 
int changeall(int* p) { // p = &m[0] or &m[1] 
    p[0]++;
    p[1]++;
    p[2]++;
    p[3]++;
    return p[1];
}

/**
 * call has side-effect meminstr
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

        m[5] = m [1]; // a variable instead of a constant

        changeall(p); 

        if(m[0] + m[1] < m[2]) {
            m[3] = m[0] - m[1];
        } else {
            m[3] = m[0] * m[1];
        }

        m[4] = m[2] * m[2];

        m[0]++;
    }

    return m[5]; // this should not be 30
}

// mem2reg pass -> all m[i] -> variables 
