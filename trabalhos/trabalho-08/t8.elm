import Html exposing (text)

type alias Env = (String -> Int)
zero : Env
zero = \ask -> 0

type Exp = Add Exp Exp
            | Sub Exp Exp
            | Mult Exp Exp
            | Div Exp Exp
            | Num Int
            | Var String

type Prog = Attr String Exp
            | If Exp Prog Prog -- Condição / ProgramaTrue / ProgramaFalse
            | While Exp Prog -- Condição / Programa
            | Seq Prog Prog

e1 : Exp
e1 = Add (Num 9) (Num 1)

evalExp : Exp -> Env -> Int
evalExp exp env =
    case exp of
        Add exp1 exp2  -> (evalExp exp1 env) + (evalExp exp2 env)
        Sub exp1 exp2 -> (evalExp exp1 env) - (evalExp exp2 env)
        Mult exp1 exp2 -> (evalExp exp1 env) * (evalExp exp2 env)
        Div exp1 exp2 -> (evalExp exp1 env) // (evalExp exp2 env)
        Num v          -> v
        Var var        -> (env var)

evalProg : Prog -> Env -> Env
evalProg s env =
    case s of
        Seq s1 s2 ->
            (evalProg s2 (evalProg s1 env))
        If cond progTrue progFalse -> 
            if (evalExp cond env) /= 0 
            then (evalProg progTrue env)
            else (evalProg progFalse env)
        While cond prog ->
            if (evalExp cond env) /= 0
            then 
                (evalProg (While cond prog) (evalProg prog env))
            else env
        Attr var exp ->
            let
                val = (evalExp exp env)
            in
                \ask -> if ask==var then val else (env ask)

lang : Prog -> Int
lang p = ((evalProg p zero) "ret")

pAdd : Prog -- Teste de Attr e Add
pAdd = (Attr "ret" (Add (Num 11) (Num 9)))

pSeq : Prog -- Teste de Seq e Sub
pSeq =  (Seq
            (Attr "x"   (Num 11))
            (Attr "ret" (Sub (Var "x") (Num 9)))
        )

pIf : Prog -- Teste de If, Mult e Div
pIf =   (Seq
            (Attr "x" (Num 1))
            (If (Var "x")
                (Attr "ret" (Mult (Num 3) (Num 7)))
                (Attr "ret" (Div (Num 20) (Num 5))))
        )

pWhile: Prog -- Teste de While
pWhile =    (Seq
                (Seq
                    (Attr "i" (Num 100000))
                    (While (Var "i")
                        (Seq
                            (Attr "i" (Sub (Var "i") (Num 1)))
                            (Attr "x" (Add (Var "x") (Num 1)))
                        )
                    )
                )
                (Attr "ret" (Var "x"))
            )

main = text (toString (lang pWhile))
