function [sfunc, cfunc, tfunc] = hyperb(x)
  %% hyperb(x) calculates sin, cos and tan hyperbolics as [sin, cos, tan]
  sfunc = sinh(x)
  cfunc = cosh(x)
  tfunc = tanh(x)
end
