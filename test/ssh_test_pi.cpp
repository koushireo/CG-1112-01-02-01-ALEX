#include <iostream>

using namespace std;

int main(){
    char input;
    while(cin >> input, input != 'q'){
        cout << "input received:" << input << endl;
    }

    return 0;
}

