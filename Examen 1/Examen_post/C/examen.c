#include <stdio.h>
#include <math.h>

int sumar_lista (int lista[], int len) {
	int suma = 0;
	for (int i = 0 ; i < len ; i++) {
		suma+=lista[i];
	}
	return suma;
}

int max_lista (int lista[], int len) {
	int max = lista[0];
	for (int i = 1 ; i < len ; i++) {
		if (lista[i] > max) {
			max = lista[i];
		}
	}
	return max;
}

int tribo (int n) {
	if (n <= 2) {
		return 1;
	}
	return tribo(n-1) + tribo(n-2) + tribo(n-3);
}

double* puntoFijo (double root[], int iters) {
	for (int i = 0 ; i < iters ; i++) {
		root[0] = (double) 1 / 5 * (root[1] + root[2] + 1);
		root[1] = (double) 1 / 5 * (root[0] + pow(root[3], 2) + root[2]);
		root[2] = (double) 1 / 5 * (root[0] + root[1] + pow(root[3], 2));
	}
	return root;
}

int main () {
	int array[5] = {1, 2, 3, 4, 5};
	printf("sumar_lista()= %d\n", sumar_lista(array, 5));
	printf("max_lista() = %d\n", max_lista(array, 5));
	printf("tribo(5) = %d\n", tribo(5));
	printf("tribo(10^6)/tribo(10^6-1) = %d\n", ((double) tribo(10^6))/tribo(10^6-1));
	double root [3] = {1, 1, 1};
	double *out;
	out = puntoFijo(root, 100);
	printf("puntoFijo({1, 1, 1}, 100) = {%f, %f, %f}\n", out[0], out[1], out[2]);
	printf("\tf1(puntoFijo({1, 1, 1}, 100)[0]) = %f\n", (double) 1 / 5 * (out[1] + out[2] + 1)); 
	printf("\tf2(puntoFijo({1, 1, 1}, 100)[1]) = %f\n", (double) 1 / 5 * (out[0] + pow(out[3], 2) + out[2])); 
	printf("\tf3(puntoFijo({1, 1, 1}, 100)[2]) = %f\n", (double) 1 / 5 * (out[0] + out[1] + pow(out[3], 2))); 
}
