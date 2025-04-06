#include <iostream>
#include <bitset>

#define sp  "\n"

using namespace std;
int bitset4_to_signed(bitset<4> bits) {
    if (bits[3] == 0) return static_cast<int>(bits.to_ulong());       // Positive
    else return static_cast<int>(bits.to_ulong()) - 16;               // Two's complement
}

int main()
{
    bitset<4> a;
    bitset<4> b;

    cout<<"enter the first number (a):";
    cin>>a;
    cout<<"enter the second number (b):";
    cin>>b;
    
    int A=bitset4_to_signed(a);
    int B=bitset4_to_signed(b);

    cout<<"the a is "<<a<<" the signed of a is "<<A<<sp;
    cout<<"the b is "<<b<<" the signed of b is "<<B<<sp;

    bitset<4> sel;
    cout<<"enter the select mux (sel):";
    cin>>sel;
    cout<<"the sel is "<<sel<<sp;

    bitset<1> selAorL(sel[3]);
    cout<<selAorL<<sp;
    bitset<3> selBits;

    selBits[0] = sel[0];  
    selBits[1] = sel[1];  
    selBits[2] = sel[2];  

    cout<<selBits<<sp;
    int ans;
    
    switch (selAorL[0])
    {
        case 0:
            switch(selBits.to_ulong()){
                case 0: 
                    ans=A+1;
                    break;
                case 1:
                    ans =B+1;
                    break;
                case 2:
                    ans =A;
                    break;
                case 3:
                    ans=B;
                    break;
                case 4:
                    ans=B-1;
                    break;
                case 5:
                    ans=A*B;
                    break;
                case 6:
                    ans=A+B;
                    break;
                case 7:
                    ans=A-B;
                    break;
                default:
                    cout<<"there is a wrong in Arithmetic switch"<<sp;
            }
            break;

        case 1:
        switch(selBits.to_ulong()){
            case 0: 
                ans=~A;
                break;
            case 1:
                ans =~B;
                break;
            case 2:
                ans =A&B;
                break;
            case 3:
                ans=A|B;
                break;
            case 4:
                ans=A^B;
                break;
            case 5:
                ans=~(A^B);
                break;
            case 6:
                ans=~(A&B);
                break;
            case 7:
                ans=~(A|B);
                break;
            default:
                cout<<"there is a wrong in Arithmetic switch"<<sp;
        }

            break;


        default:
            cout<<"there is a wrong in selAorL"<<sp;
    }

    bitset<4> ansBits(ans);

    cout<<"the answer is "<<ans<< " ("<<ansBits<<")"<<sp;
        

}