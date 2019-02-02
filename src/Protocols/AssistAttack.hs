
module Protocols.AssistAttack(
    assitAttack
  -- print $ parse assitAttack "parse assit attack" "AssitantName<16><STEAM_1:0:123123><TERRORIST> assisted killing VictimName<12><STEAM_1:0:15612><CT>"
) where

import Text.Parsec (char, endBy, many, noneOf, ParseError, sepBy, (<|>), digit, many1, string, alphaNum)
import Text.Parsec.String (Parser)

type AName = String
type VName = String 

type AUserid = Int
type VUserid = Int

type ASteamid = String
type VSteamid = String

type ATeam = String
type VTeam = String 


data AssitType = Assit AName AUserid ASteamid ATeam VName VUserid VSteamid VTeam  
instance  Show AssitType where
  show (Assit aName aUserid aSteamid aTeam vName vUserid vSteamid vTeam) = 
                                            "Assist player name: " ++  aName ++ "\n Assit userid: " ++  (show aUserid) ++ "\n Assit steam id: " ++   aSteamid ++ "\n Assit team: " ++   aTeam
                                            ++ "\n victim player name: " ++  vName ++ "\n victim userid: " ++  (show vUserid) ++ "\n victim steamid: " ++   vSteamid ++ "\n victim team: " ++   vTeam


idName :: Parser String
idName = many1 alphaNum  

userId :: Parser Int
userId = read <$> many1 digit

sep :: Parser String
sep = string "><"

steamId :: Parser String
steamId =  do
  x <- string "STEAM_"
  y <- number'
  a <- char ':'
  z <- number'
  b <- char ':'
  c <- number'
  return $  x  ++ (show y) ++  [a] ++ (show z) ++  [a] ++ (show c)
  

team :: Parser String
team = string "TERRORIST" <|> string "CT"

assitAttack :: Parser AssitType
assitAttack = Assit <$>
    idName <* char '<' <*>
    userId <*  sep <*>
    steamId <* sep <*>
    team   <* char '>' <* spaces <* string "assisted killing" <* spaces <*>
    idName <* char '<' <*>
    userId <*  sep <*>
    steamId <* sep <*>
    team  <* char '>' <* spaces


number' :: Parser Int
number' =  read <$> many1 digit 

spaces = many $ char ' '
delimiter = spaces >> char '.' >> spaces






