package tp06

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
  val id = Abs(x, x)
  
  test("t1 t2 t3 t4 <--> ((t1 t2) t3) t4") {
    assert(buildApp(List(t1, t2, t3, t4)) === App(App(App(t1, t2), t3), t4))
  }
  test("buildApp([t1]) === t1") {
    assert(buildApp(List(t1)) === t1)
  }
  intercept[Exception] {
    buildApp(List())
  }
  
  
  test("x[t/x] --> t") {
    assert(subst(x, t, x) === t)
  }
  test("y[t/x] --> y") {
    assert(subst(x, t, y) === y)
  }
  test("(lambda x. t2)[t/x] --> lambda x. t2") {
    assert(subst(x, t, Abs(x, t2)) === Abs(x, t2))
  }
  test("id[t/x] --> id") {
    assert(subst(x, t, id) === id)
  }
  test("(lambda y. t2)[t/x] --> lambda y. t2") {
    assert(subst(x, t, Abs(y, t2)) === Abs(y, t2))
  }
  test("(lambda y. x)[t/x] --> lambda y. t") {
    assert(subst(x, t, Abs(y, x)) === Abs(y, t))
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
  test("buildNewCtx([y->t2, z->t3], App(t1, t2)) --> [y->t2, z->t3]") {
    val ctx = List(Val(y, t2), Val(z, t3))
    assert(buildNewCtx(ctx, Some(App(t1, t2))) === ctx)
  }
  test("buildNewCtx([y->t2, z->t3], None) --> [y->t2, z->t3]") {
    val ctx = List(Val(y, t2), Val(z, t3))
    assert(buildNewCtx(ctx, None) === ctx)
  }
  
  
  test("lambda x. t est une valeur") {
    assert(isVal(Abs(x, t)))
  }
  test("val y = lambda x. t est une valeur") {
    assert(isVal(Val(y, Abs(x, t))))
  }
  test("x n'est pas une valeur") {
    assert(!isVal(x))
  }
  test("x y n'est pas une valeur") {
    assert(!isVal(App(x, y)))
  }
  
  
  test("x n'est pas clos") {
    assert(!isClosed(x))
  }
  test("id est clos") {
    assert(isClosed(id))
  }
  test("lambda x. x x est clos") {
    assert(isClosed(Abs(x, App(x, x))))
  }  
  test("lambda x. x lambda y. y est clos") {
    assert(isClosed(Abs(x, App(x, Abs(y, y)))))
  }  
  test("lambda x. id est clos") {
    assert(isClosed(Abs(x, id)))
  }
  test("lambda x. y n'est pas clos") {
    assert(!isClosed(Abs(x, y)))
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
  test("val x = y n'est pas clos") {
    assert(!isClosed(Val(x, y)))
  }
}