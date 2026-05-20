function varargout=sym_congestionControlModel(action,varargin)

switch action
  case 'ntau'
   varargout{1}=1;
   return
  case 'tp_del'
   varargout{1}=0;
   return
  case 'maxorder'
   varargout{1}=5;
   return
  case 'directional_derivative'
   varargout{1}=0;
   return
end
ind=varargin{1};
order=varargin{2};
nout=varargin{3};
f=str2func(sprintf('sym_congestionControlModel_%s_%d_%d',action,ind,order));
varargout=cell(nout,1);
[varargout{:}]=f(varargin{4:end});

function [out1,out2] = sym_congestionControlModel_rhs_1_0(w,q,wtau,qtau,k,tau,delay)
out1 = delay.*w.*(w./k-1.0).*-1.5e+1-(delay.*q.*w)./(w+5.0);
if nargout > 1
    t2 = delay.*(-1.0./1.0e+1);
    out2 = q.*t2+(delay.*qtau.*wtau.*exp(t2))./(wtau+5.0);
end

function [out1,out2] = sym_congestionControlModel_rhs_1_1(w,q,wtau,qtau,k,tau,delay,w_d,q_d,wtau_d,qtau_d,k_d,tau_d,delay_d)
t2 = w+5.0;
t3 = wtau+5.0;
t4 = 1.0./k;
t8 = delay./1.0e+1;
t5 = 1.0./t2;
t6 = 1.0./t3;
t7 = t4.*w;
t9 = -t8;
t10 = exp(t9);
t11 = t7-1.0;
out1 = delay.*w.*(t4.*w_d-k_d.*t4.*t7).*-1.5e+1-delay_d.*t11.*w.*1.5e+1-delay.*t11.*w_d.*1.5e+1-delay_d.*q.*t5.*w-delay.*q.*t5.*w_d-delay.*q_d.*t5.*w+delay.*q.*t5.^2.*w.*w_d;
if nargout > 1
    out2 = delay_d.*q.*(-1.0./1.0e+1)-(delay.*q_d)./1.0e+1+delay.*qtau.*t6.*t10.*wtau_d+delay.*qtau_d.*t6.*t10.*wtau+delay_d.*qtau.*t6.*t10.*wtau-delay.*qtau.*t6.^2.*t10.*wtau.*wtau_d-(delay.*delay_d.*qtau.*t6.*t10.*wtau)./1.0e+1;
end
