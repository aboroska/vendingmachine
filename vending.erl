-module(vending).

-export([test/2, test/3]).

test(Price, Paid) ->
  Coins = [
    {20000, 3},
    {10000, 3},
    {5000, 3},
    {2000, 3},
    {1000, 3},
    {500, 3},
    {200, 3},
    {100, 3},
    {50, 3},
    {20, 3},
    {10, 3},
    {5, 3}
  ],
  test(Price, Paid, Coins).

test(Price, Paid, Coins) ->
  Target = Paid - Price,
  change_back(Target, Coins, [], 0).

change_back(Target, _Coins, CoinsBack, Sum) when Sum =:= Target ->
  {ok, CoinsBack};
change_back(_Target, [], CoinsBack, Sum) ->
  {not_enough_coin, Sum, CoinsBack};
change_back(Target, [{_Coin, 0} | Coins], CoinsBack, Sum) ->
  change_back(Target, Coins, CoinsBack, Sum);
change_back(Target, [{Coin, _Count} | Coins], CoinsBack, Sum) when Sum + Coin > Target ->
  change_back(Target, Coins, CoinsBack, Sum);
change_back(Target, [{Coin, Count} | Coins], CoinsBack, Sum) ->
  change_back(Target, [{Coin, Count - 1} | Coins], [Coin | CoinsBack], Sum + Coin).
