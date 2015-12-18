% clear; close all;
% 
% n = 100;
% x = linspace(0,2*pi,n);   % test data
% t = sin(x)+rand(1,n)/2;
% 
% model = knReg(x,t,1e-4,@knGauss);
% y = knRegPred(model, x);
% figure;
% hold on;
% plot(x,t,'o');
% plot(x,y,'r-');
d = 2;
k = 3;
n = 500;
[X,y] = kmeansRnd(d,k,n);
label = ceil(k*rand(1,n));
[y1,en1] = knKmeans(X, label, @knLin);
[y2,en2] = kmeans(X,label);
% idx = 1:2:n;
% Xt = X(:,idx);
% label = knKmeansPred(model, Xt);
% spread(Xt,label)

%% kernel kmeans with linear kernel is kmeans
d = 2;
k = 3;
n = 500;
[X,y] = kmeansRnd(d,k,n);
init = ceil(k*rand(1,n));
[y_kn,en_kn,model_kn] = knKmeans(X,init,@knLin);
[y_lin,en_lin,model_lin] = kmeans(X,init);

idx = 1:2:n;
Xt = X(:,idx);

[t_kn,ent_kn] = knKmeansPred(model_kn, Xt);
[t_lin,ent_lin] = kmeansPred(model_lin, Xt);

maxabsdiff(y_kn,y_lin)
maxabsdiff(en_kn,en_lin)

maxabsdiff(t_kn,t_lin)
maxabsdiff(ent_kn,ent_lin)

%% kernel regression with linear kernel is linear regression
% clear; close all;
% n = 100;
% x = linspace(0,2*pi,n);   % test data
% t = sin(x)+rand(1,n)/2;
% lambda = 1e-4;
% model_kn = knReg(x,t,lambda,@knLin);
% model_lin = linReg(x,t,lambda);
% 
% idx = 1:2:n;
% xt = x(:,idx);
% tt = t(idx);
% 
% [y_kn, sigma_kn,p_kn] = knRegPred(model_kn,xt,tt);
% [y_lin, sigma_lin,p_lin] = linPred(model_lin,xt,tt);
% 
% maxabsdiff(y_kn,y_lin)
% maxabsdiff(sigma_kn,sigma_lin)
% maxabsdiff(p_kn,p_lin)
%% test case for knCenter
% kn = @knGauss;
% X=rand(2,100);
% X1=rand(2,10);
% X2=rand(2,5);
% 
% isequalf(knCenter(kn,X,X1),diag(knCenter(kn,X,X1,X1)))
% isequalf(knCenter(kn,X),knCenter(kn,X,X,X));