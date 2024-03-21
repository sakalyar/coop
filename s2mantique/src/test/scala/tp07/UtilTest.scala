package tp07

import org.junit.runner.RunWith
import org.scalatest.funsuite.AnyFunSuite
import org.scalatestplus.junit.JUnitRunner
import Util._

@RunWith(classOf[JUnitRunner])
class UtilTest extends AnyFunSuite {
  val t = Var("t")
  val t1 = Var("t1")
  val t2 = Var("t2")
  val t3 = Var("t3")
  val t4 = Var("t4")
  val x = Var("x")
  val y = Var("y")
  val z = Var("z")
  val id = Abs(x, Bool, x)
  val typ1 = Bool
  val typ2 = Nat
  val typ3 = Fct(Bool, Bool)
  val typ4 = Fct(Nat, Bool)
  
  test("t1 t2 t3 t4 <--> ((t1 t2) t3) t4") {
    assert(buildApp(List(t1, t2, t3, t4)) === App(App(App(t1, t2), t3), t4))
  }
  test("buildApp([t1]) === t1") {
    assert(buildApp(List(t1)) === t1)
  }
  intercept[Exception] {
    buildApp(List())
  }
  
  
  test("typ1 -> typ2 -> typ3 -> typ4 <--> typ1 -> (typ2 -> (typ3 -> typ4))") {
    assert(buildFctType(List(typ1, typ2, typ3, typ4))
        === Fct(typ1, Fct(typ2, Fct(typ3, typ4))))
  }
  test("buildFctType([typ1]) === typ1") {
    assert(buildFctType(List(typ1)) === typ1)
  }
  intercept[Exception] {
    buildFctType(List())
  }
  
  
  test("x[t/x] --> t") {
    assert(subst(x, t, x) === t)
  }
  test("y[t/x] --> y") {
    assert(subst(x, t, y) === y)
  }
  test("(lambda x : Bool. t2)[t/x] --> lambda x : Bool. t2") {
    assert(subst(x, t, Abs(x, Bool, t2)) === Abs(x, Bool, t2))
  }
  test("id[t/x] --> id") {
    assert(subst(x, t, id) === id)
  }
  test("(lambda y : Nat. t2)[t/x] --> lambda y : Nat. t2") {
    assert(subst(x, t, Abs(y, Nat, t2)) === Abs(y, Nat, t2))
  }
  test("(lambda y : Nat. x)[t/x] --> lambda y : Nat. t") {
    assert(subst(x, t, Abs(y, Nat, x)) === Abs(y, Nat, t))
  }
  test("(t1 t2)[t/x] --> t1 t2") {
    assert(subst(x, t, App(t1, t2)) === App(t1, t2))
  }
  test("(x t2)[t/x] --> t t2") {
    assert(subst(x, t, App(x, t2)) === App(t, t2))
  }
  test("(t1 x)[t/x] --> t1 t") {
    assert(subst(x, t, App(t1, x)) === App(t1, t))
  }
  test("(x x)[t/x] --> t t") {
    assert(subst(x, t, App(x, x)) === App(t, t))
  }
  test("(val y = t2)[t/x] --> val y = t2") {
    assert(subst(x, t, Val(y, t2)) === Val(y, t2))
  }
  test("(val y = x)[t/x] --> val y = t") {
    assert(subst(x, t, Val(y, x)) === Val(y, t))
  }
  test("(val x = t2)[t/x] --> val x = t2") {
    assert(subst(x, t, Val(x, t2)) === Val(x, t2))
  }
  test("(val x = x)[t/x] --> val x = t") {
    assert(subst(x, t, Val(x, x)) === Val(x, t))
  }
  test("(succ t1)[t/x] --> succ t1") {
    assert(subst(x, t, Succ(t1)) === Succ(t1))
  }
  test("(succ x)[t/x] --> succ t") {
    assert(subst(x, t, Succ(x)) === Succ(t))
  }
  test("(pred t1)[t/x] --> pred t1") {
    assert(subst(x, t, Pred(t1)) === Pred(t1))
  }
  test("(pred x)[t/x] --> pred t") {
    assert(subst(x, t, Pred(x)) === Pred(t))
  }
  test("(iszero t1)[t/x] --> iszero t1") {
    assert(subst(x, t, IsZero(t1)) === IsZero(t1))
  }
  test("(iszero x)[t/x] --> iszero t") {
    assert(subst(x, t, IsZero(x)) === IsZero(t))
  }
  
  
  test("inject([x->t1], x) --> t1") {
    val ctx = List(Val(x, t1))
    val term = x
    val result = t1
    assert(inject(ctx, term) === result)
  }
  test("inject([x->y, y->t2], x) --> t2") {
    val ctx = List(Val(x, y), Val(y, t2))
    val term = x
    val result = t2
    assert(inject(ctx, term) === result)
  }  
  test("inject([y->t2, x->y], x) --> y") {
    val ctx = List(Val(y, t2), Val(x, y))
    val term = x
    val result = y
    assert(inject(ctx, term) === result)
  }  
  test("inject([x->t1, y->t2, x->t3, z->t4], x (y z x)) --> t1 (t2 t4 t1)") {
    val ctx = List(Val(x, t1), Val(y, t2), Val(x, t3), Val(z, t4))
    val term = App(x, App(App(y, z), x))
    val result = App(t1, App(App(t2, t4), t1))
    assert(inject(ctx, term) === result)
  }  
  test("inject([], t) --> t") {
    val ctx = List()
    val term = t
    val result = t
    assert(inject(ctx, term) === result)
  }

  
  test("buildNewCtx([y->t2, z->t3], Val(x, t1)) --> [x->t1, y->t2, z->t3]") {
    val ctx = List(Val(y, t2), Val(z, t3))
    val result = List(Val(x, t1), Val(y, t2), Val(z, t3))
    assert(buildNewCtx(ctx, Some(Val(x, t1))) === result)
  }
  test("buildNewCtx([y->t2, z->t3], App(t1, t2)) --> [x->t1, y->t2, z->t3]") {
    val ctx = List(Val(y, t2), Val(z, t3))
    assert(buildNewCtx(ctx, Some(App(t1, t2))) === ctx)
  }
  test("buildNewCtx([y->t2, z->t3], None) --> [x->t1, y->t2, z->t3]") {
    val ctx = List(Val(y, t2), Val(z, t3))
    assert(buildNewCtx(ctx, None) === ctx)
  }
  
  
  test("0, 2, True et False sont des valeurs") {
    assert(isVal(Zero))
    assert(isVal(Succ(Succ(Zero))))
    assert(isVal(True))
    assert(isVal(False))
  }
  test("lambda x : Nat. t est une valeur") {
    assert(isVal(Abs(x, Nat, t)))
  }
  test("val y = lambda x : Nat. t est une valeur") {
    assert(isVal(Val(y, Abs(x, Nat, t))))
  }
  test("des termes qui ne sont pas des valeurs") {
    assert(!isVal(x))
    assert(!isVal(Pred(Zero)))
    assert(!isVal(Cond(True, Zero, Zero)))
    assert(!isVal(IsZero(Zero)))
    assert(!isVal(App(t1, t2)))
  }

  
  
  test("0 et 3 sont des valeurs numériques") {
    assert(isNumVal(Zero))
    assert(isNumVal(Succ(Succ(Succ(Zero)))))
  }
  test("des termes qui ne sont pas des valeurs numériques") {
    assert(!isNumVal(Pred(Zero)))
    assert(!isNumVal(Succ(Pred(Zero))))
    assert(!isNumVal(Pred(Succ(Zero))))
    assert(!isNumVal(True))
  }
  
  
  test("x n'est pas clos") {
    assert(!isClosed(x))
  }
  test("id est clos") {
    assert(isClosed(id))
  }
  test("lambda x : Bool. x x est clos") {
    assert(isClosed(Abs(x, Bool, App(x, x))))
  }  
  test("lambda x : Bool. x lambda y : Bool. y est clos") {
    assert(isClosed(Abs(x, Bool, App(x, Abs(y, Bool, y)))))
  }  
  test("lambda x : Nat. id est clos") {
    assert(isClosed(Abs(x, Nat, id)))
  }
  test("lambda x : Bool. y n'est pas clos") {
    assert(!isClosed(Abs(x, Bool, y)))
  }
  test("id id est clos") {
    assert(isClosed(App(id, id)))
  }
  test("x y n'est pas clos") {
    assert(!isClosed(App(x, y)))
  }
  test("x x n'est pas clos") {
    assert(!isClosed(App(x, x)))
  }
  test("val x = id est clos") {
    assert(isClosed(Val(x, id)))
  }
  test("val x = x n'est pas clos") {
    assert(!isClosed(Val(x, x)))
  }
  test("val x = y) n'est pas clos") {
    assert(!isClosed(Val(x, y)))
  }
  test("succ id est clos") {
    assert(isClosed(Succ(id)))
  }
  test("succ x n'est pas clos") {
    assert(!isClosed(Succ(x)))
  }
  test("pred id est clos") {
    assert(isClosed(Pred(id)))
  }
  test("pred x n'est pas clos") {
    assert(!isClosed(Pred(x)))
  }
  test("iszero id est clos") {
    assert(isClosed(IsZero(id)))
  }
  test("iszero x n'est pas clos") {
    assert(!isClosed(IsZero(x)))
  }
  test("if id then id else id est clos") {
    assert(isClosed(Cond(id, id, id)))
  }
  test("if x then id else id n'est pas clos") {
    assert(!isClosed(Cond(x, id, id)))
  }
  test("if id then x else id n'est pas clos") {
    assert(!isClosed(Cond(id, x, id)))
  }
  test("if id then id else x n'est pas clos") {
    assert(!isClosed(Cond(id, id, x)))
  }
}