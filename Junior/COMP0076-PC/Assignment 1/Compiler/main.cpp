#include <iostream>
using namespace std;
int main()
{
    int i, n, f;
    for(int j=0;j<100;j++)
    {}
    cin >> n;
    i = 2;
    f = 1;
    while (i <= n)
    {
        f = f * i;
        i = i + 1;
    }
    cout << f << endl;
}
