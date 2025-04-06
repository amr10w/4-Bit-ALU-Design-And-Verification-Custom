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
    cout<<"*******************************"<<sp;

    
    int A=bitset4_to_signed(a);
    int B=bitset4_to_signed(b);

    cout<<"the a is "<<a<<" the signed of a is "<<A<<sp;
    cout<<"the b is "<<b<<" the signed of b is "<<B<<sp;
    cout<<"*******************************"<<sp;

    bitset<4> sel;
    cout<<"enter the select mux (sel):";
    cin>>sel;
    cout<<"the sel is "<<sel<<sp;
    cout<<"*******************************"<<sp;

    bitset<1> selAorL(sel[3]);
    cout<<"SELECT Arithmetic OR Logic is "<<selAorL<<sp;
    bitset<3> selBits;

    selBits[0] = sel[0];  
    selBits[1] = sel[1];  
    selBits[2] = sel[2];  

    cout<<"SELECT Operation is "<<selBits<<sp;
    cout<<"*******************************"<<sp;

    int ans;
    int selectAorL=(int)selAorL[0];
    switch (selectAorL)
    {
        case 0:
            switch(selBits.to_ulong()){
                case 0: 
                    cout<<"Increment a"<<sp;
                    ans=A+1;
                    break;
                case 1:
                    cout<<"Increment b"<<sp;
                    ans =B+1;
                    break;
                case 2:
                    cout<<"Transfer a"<<sp;
                    ans =A;
                    break;
                case 3:
                    cout<<"Transfer b"<<sp;
                    ans=B;
                    break;
                case 4:
                    cout<<"Decrement a "<<sp;
                    ans=A-1;
                    break;
                case 5:
                    cout<<"Multiply a and b"<<sp;
                    ans=A*B;
                    break;
                case 6:
                    cout<<"add a and b"<<sp;
                    ans=A+B;
                    break;
                case 7:
                    cout<<"Subtract a and b"<<sp;
                    ans=A-B;
                    break;
                default:
                    cout<<"there is a wrong in Arithmetic switch"<<sp;
            }
            break;

        case 1:
            switch(selBits.to_ulong()){
                case 0: 
                    cout<<"Complement a"<<sp;
                    ans=~A;
                    break;
                case 1:
                    cout<<"Complement b"<<sp;
                    ans =~B;
                    break;
                case 2:
                    cout<<"AND a and b"<<sp;
                    ans =A&B;
                    break;
                case 3:
                    cout<<"OR a and b"<<sp;
                    ans=A|B;
                    break;
                case 4:
                    cout<<"XOR a and b"<<sp;
                    ans=A^B;
                    break;
                case 5:
                    cout<<"XNOR a and b"<<sp;
                    ans=~(A^B);
                    break;
                case 6:
                    cout<<"NAND a and b"<<sp; 
                    ans=~(A&B);
                    break;
                case 7:
                    cout<<"NOR a and b"<<sp;
                    ans=~(A|B);
                    break;
                default:
                    cout<<"there is a wrong in Arithmetic switch"<<sp;
        }

            break;


        default:
            cout<<"there is a wrong in selAorL"<<sp;
    }

    bitset<8> ansBits(ans);
    cout<<"*******************************"<<sp;
    cout<<"the answer is "<<ans<< " ("<<ansBits<<")"<<sp;

}