# Vending machine exercise

This is an example solution of the following exercise:

"Implement a vending machine that it filled with notes and returns the exact change after the product is selected."

## Running the program in Erlang shell

    c(vending),
    Price = 12100,
    Paid = 20000,
    vending:test(Price, Paid).

    {ok,[200,200,500,2000,5000]}
  
