#include <iostream>
using namespace std;

int main(){
    char key = ' ';

    while(cin >> key, key != 'q'){
	cout << (key == 'w');
    }
	
    return 0;
}
