-module(vending).

-export([test/2]).

test(Price, Paid) ->
  Coins = [20000, 10000, 5000, 2000, 1000, 500, 200, 100, 50, 20, 10, 5],
  Target = Paid - Price,
  change_back(Target, Coins, [], 0).

change_back(Target, _Coins, CoinsBack, Sum) when Sum =:= Target ->
  CoinsBack;
change_back(Target, [Coin|Coins], CoinsBack, Sum) when Sum + Coin > Target ->
  change_back(Target, Coins, CoinsBack, Sum);
change_back(Target, [Coin|Coins], CoinsBack, Sum) ->
  change_back(Target, [Coin|Coins], [Coin|CoinsBack], Sum + Coin).


