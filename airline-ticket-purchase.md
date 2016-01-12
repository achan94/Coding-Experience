#### Code
This is a set of C++ code I created to compute projected cost to go roundtrip between Monterey, CA, and Monterrey, MEX.

    #include <iostream>
    #include <string>
    #include <sstream>
    using namespace std;
    
    int main()
    {
        string airline, description, strMiles, strPrice;
        double miles, price, average_cost, CostperMile, totalCostperMile, 
        distMontereytoMonterey,ProjectedCostForMonterey;
        
        cout << "Enter your airlines: ";
        getline(cin, airline);

        cout << endl << "----------- Trip 1 ---------------" << endl;
        cout << "Enter your flight description: ";
        getline (cin, description);
        cout << "Enter the price of the ticket: ";
        getline (cin, strPrice);
        cout << "Enter miles of the round-trip travel: ";
        getline (cin, strMiles);
      
        istringstream (strPrice) >> price;
        istringstream (strMiles) >> miles;
        totalCostperMile = 0;
         
        if ((airline.length() >= 2) && (description.length() >= 4) && (miles >= 20) 
        && (price >= 1))
        {
            cout << airline << endl << "flight : " << description << endl << 
            "price : $" << strPrice << endl << "distance : " << strMiles << 
            " miles" << endl;
            CostperMile = price/miles;
            totalCostperMile = totalCostperMile + CostperMile;
        }
        else
        {
            cout << "Something is wrong with the data of your flight!" <<endl;
            return 1;
        }
        
        cout << endl <<"----------- Trip 2 ---------------" << endl;
        cout << "Enter your flight description: ";
        getline (cin, description);
        cout << "Enter the price of the ticket: ";
        getline (cin, strPrice);
        cout << "Enter miles of the round-trip travel: ";
        getline (cin, strMiles);
   
        istringstream (strPrice) >> price;
        istringstream (strMiles) >> miles;
       
        if ((description.length() >= 4) && (miles >= 20) && (price >= 1))
        {
            cout << airline << endl << "flight : " << description << endl << 
            "price : $" << strPrice << endl << "distance : " << strMiles << 
            " miles" << endl;
            CostperMile = price/miles;
            totalCostperMile = totalCostperMile + CostperMile;
        }
        else
        {
            cout << "Something is wrong with the data of your flight!" << endl;
            return 1;
        }
   
        cout << endl << "----------- Trip 3 ---------------" << endl;
        cout << "Enter your flight description: ";
        getline (cin, description);
        cout << "Enter the price of the ticket: ";
        getline (cin, strPrice);
        cout << "Enter miles of the round-trip travel: ";
        getline (cin, strMiles);

        istringstream (strPrice) >> price;
        istringstream (strMiles) >> miles;
      
        if ((description.length() >= 4) && (miles >= 20) && (price >= 1))
        {
            cout << airline << endl << "flight : " << description << endl << 
            "price : $" << strPrice << endl << "distance : " << strMiles << 
            " miles" << endl;
            CostperMile = price/miles;
            totalCostperMile = totalCostperMile + CostperMile;
        }
        else
        {
            cout << "Something is wrong with the data of your flight!" <<endl;
            return 1;
        }

        distMontereytoMonterey = 2958.98;
        average_cost = totalCostperMile / 3;
        ProjectedCostForMonterey = distMontereytoMonterey * average_cost;
        
        cout << endl << "Average cost per mile based on those three trips: " 
            << endl << average_cost << " $/mile" << endl;
        cout << "Projected cost to go roundtrip between Monterey, CA, " 
            << "and Monterrey, MEX is" << endl << "$" << ProjectedCostForMonterey 
            << endl;

        return 0;
    }
    
#### Sample run
This sample run was obtained after running the code above in Microsoft Visual Studio Express 2012.

    Enter your airlines: American Airlines
    
    ----------- Trip 1 ---------------
    Enter your flight description: SJC/LAX - AA2600
    Enter the price of the ticket: 168
    Enter miles of the round-trip travel: 616
    American Airlines
    flight : SJC/LAX - AA2600
    price : $168
    distance : 616 miles
    
    ----------- Trip 2 ---------------
    Enter your flight description: SFO/DCA - AA2278
    Enter the price of the ticket: 444
    Enter miles of the round-trip travel: 5312
    American Airlines
    flight : SFO/DCA - AA2278
    price : $444
    distance : 5312 miles
    
    ----------- Trip 3 ---------------
    Enter your flight description: LAX/MCO - AA244
    Enter the price of the ticket: 362
    Enter miles of the round-trip travel: 4434
    American Airlines
    flight : LAX/MCO - AA244
    price : $362
    distance : 4434 miles
    
    Average cost per mile based on those three trips:
    0.145984 $/mile
    Projected cost to go roundtrip between Monterey, CA, and Monterrey, MEX is
    $431.965
    Press any key to continue . . .


