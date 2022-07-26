{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Servant.API
import Servant.Server
import Network.Wai
import Network.Wai.Handler.Warp

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import Control.Monad.IO.Class

import TxModels
import NodeProcs

import Data.Proxy
-- import Data.Aeson.Types

instance ToJSON TXInfo
instance FromJSON TXInfo

-- :> Capture "name" String    can be added to capture value in url
-- for another endpoint  :<|>
type TxAPI =
  "api" :> "txs"
  -- :> QueryParam "sort_by" SortBy
  :> Get '[JSON] [TXInfo]
  :<|>  "api" :> "post" :> "tx" :> 
  ReqBody '[JSON] TXInfo :> Post '[JSON] TXInfo

mockTxsList :: [TXInfo]
mockTxsList = 
  [ v00,
    v01
  ] where
    v00 = TXInfo{
      scriptAddr = "addr_test1qkggkgkk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x",
      utxoUsing =  "hdddghgdfhgdfhhgfjhgf#0", -- utxo_using,
      payoutAddr = "addr_tfkkkhfgfkhfk7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak",
      txOutLoc = "txAltTesting01"}
    v01 = TXInfo{
      scriptAddr = "addr_test1qrkdtsmvwl87u89arnhpjvxz2kp4gkhpk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x",
      utxoUsing =  "78874587ehjhjes8w987w89weudfsu#0", -- utxo_using,
      payoutAddr = "addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak",
      txOutLoc = "txAltTesting00"}

myServer :: Server TxAPI
myServer = 
  getTxsInline
  :<|> postTxsInline
  
  where
    getTxsInline = return mockTxsList
    postTxsInline :: TXInfo -> Handler TXInfo
    postTxsInline _txInfo = do
      liftIO $ buildTX _txInfo
      -- liftIO $ buildScKeys $ show $ txOutLoc _txInfo
      liftIO $ putStrLn "/api/post/tx POST HIT\n"
      liftIO $ print $ show _txInfo
      liftIO $ print $ show $ utxoUsing _txInfo
      return  _txInfo

myAPI :: Proxy TxAPI
myAPI = Proxy

fullServer :: Application
fullServer = serve myAPI myServer

main :: IO ()
main = do
 -- utxoUsing is gibberish atm
  let newTX = TXInfo{
    scriptAddr = "addr_test1qrkdtsmvwl87u89arnhpjvxz2kp4gkhpk7lh0de4uzz03wyelc24kl7x4c5kay2rv4r6lz4ugu5yjaeraawcdgzztg8s6l3x4x",
    utxoUsing =  "78874587ehjhjes8w987w89weudfsu#0", -- utxo_using,
    payoutAddr = "addr_test1qpdvvdalsqscc3899gk67zdx7lkrlqlnwm3xzzk88jc65c50a06ns46p0wjxe6xqkvnrs4f79wjp6tz07wrl2k2nctyqqkhtak",
    txOutLoc = "txAltTesting00"
  }

  putStr $ "\n  " ++ show newTX

  putStrLn "\n\n Want to play a game? Check port 1335 -  /api/txs \n Maybe there is more to discover?"
  run 1335 fullServer
