void matmul(int n, int m, int l, int A[n][m], int B[m][l], int C[n][l]) {
  for (int i = 0; i < n; i++) {
    for (int k = 0; k < l; k++) {
      C[i][k] = 0;
      for (int j = 0; j < m; j++) {
        C[i][k] += A[i][j] * B[j][k];
      }
    }
  }
}
