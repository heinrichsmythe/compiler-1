module Stage.InferTypes.TypeEquation exposing
    ( TypeEquation
    , equals
    , unwrap
    )

import Elm.Data.Type exposing (TypeOrId)


{-| Could be an alias, but let's go with opaque types:
<https://www.youtube.com/watch?v=x1FU3e0sT1I>

For debuggability, we could also add the Typed.Expr value here:
the original node this constraint was generated from.

-}
type TypeEquation
    = TypeEquation ( TypeOrId, TypeOrId )


{-| Constructor for this type. It tells the constraint solver that t1 == t2.
-}
equals : TypeOrId -> TypeOrId -> TypeEquation
equals t1 t2 =
    TypeEquation ( t1, t2 )


unwrap : TypeEquation -> ( TypeOrId, TypeOrId )
unwrap (TypeEquation tuple) =
    tuple
