-module(base_kernel_payment).
-author("nhnhat").

%% API
-export([
  verify_apple_receipt/2,
  verify_google_purchased/4
]).
verify_apple_receipt(AppleShareSecret,Receipt) ->
  base_payment:verify_apple_receipt(AppleShareSecret,Receipt).
verify_google_purchased(GameId,PackageName,ProductId,PurchaseToken) ->
  base_payment:verify_google_purchased(GameId,PackageName,ProductId,PurchaseToken).