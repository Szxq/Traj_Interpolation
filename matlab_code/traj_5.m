%example��ζ���ʽ�켣���ɣ���ֱ�߹滮������滮û���м�㣩
clc
clear
%�켣��������
%ʱ��
t0=0;
t1=8;
%λ�ú��ٶȣ�a��
q0=0;
q1=10;
v0=0;
v1=0;
acc0=0;
acc1=0;
%���ù�ʽ��1-25����ϵ��
h=q1-q0;
T=t1-t0;
a0=q0;
a1=v0;
a2=1.0/2*acc0;
a3=1.0/(2*T*T*T)*(20*h-(8*v1+12*v0)*T+(acc1-3*acc0)*(T*T));
a4=1.0/(2*T*T*T*T)*(-30*h+(14*v1+16*v0)*T+(3*acc0-2*acc1)*(T*T));
a5=1.0/(2*T*T*T*T*T)*(12*h-6*(v1+v0)*T+(acc1-acc0)*(T*T));
%�켣����
t=t0:0.1:t1;%0.1s�����һ���㣬����ʮ����
%λ��
q=a0+a1*power((t-t0),1)+a2*power((t-t0),2)+a3*power((t-t0),3)+...
    a4*power(t-t0,4)+a5*power(t-t0,5);
%�ٶ�
v=a1+2*a2*power((t-t0),1)+3*a3*power((t-t0),2)+4*a4*power(t-t0,3)+...
    5*a5*power(t-t0,4);
%���ٶ�
acc=2*a2+6*a3*power((t-t0),1)+12*a4*power(t-t0,2)+20*a5*power(t-t0,3);
%��ͼ
subplot(3,2,1)
plot(t,q,'r');
axis([0,8,0,11])
ylabel('position')
grid on
subplot(3,2,3)
plot(t,v,'b');
axis([0,8,-1,2.5])
ylabel('velocity')
grid on
subplot(3,2,5)
plot(t,acc,'g');
xlabel('(a)');
ylabel('acceleration')
grid on

%ʱ��
t0=0;
t1=8;
%λ�ú��ٶȣ�a��
q0=0;
q1=10;
v0=0;
v1=2;
acc0=0;
acc1=0;
%���ù�ʽ��1-25����ϵ��
h=q1-q0;
T=t1-t0;
a0=q0;
a1=v0;
a2=1.0/2*acc0;
a3=1.0/(2*T*T*T)*(20*h-(8*v1+12*v0)*T+(acc1-3*acc0)*(T*T));
a4=1.0/(2*T*T*T*T)*((-30*h+(14*v1+16*v0)*T)+(3*acc0-2*acc1)*(T*T));
a5=1.0/(2*T*T*T*T*T)*(12*h-6*(v1+v0)*T+(acc1-acc0)*(T*T));
%�켣����
t=t0:0.1:t1;
%λ��
q=a0+a1*power((t-t0),1)+a2*power((t-t0),2)+a3*power((t-t0),3)+...
    a4*power(t-t0,4)+a5*power(t-t0,5);
%�ٶ�
v=a1+2*a2*power((t-t0),1)+3*a3*power((t-t0),2)+4*a4*power(t-t0,3)+...
    5*a5*power(t-t0,4);
%���ٶ�
acc=2*a2+6*a3*power((t-t0),1)+12*a4*power(t-t0,2)+20*a5*power(t-t0,3);
%��ͼ
subplot(3,2,2)
plot(t,q,'r');
axis([0,8,-5,30])
ylabel('position')
grid on
subplot(3,2,4)
plot(t,v,'b');
ylabel('velocity')
grid on
subplot(3,2,6)
plot(t,acc,'g');
xlabel('(b)');
ylabel('acceleration')
grid on


%example��ζ���ʽ�켣���ɣ���ֱ�߹滮������滮�������м�㣩
clc
clear
close('all')
%�켣��������
%ʱ�䡢λ�ú��ٶȣ�a��
t_array=[0,2,4,6,8];
q_array=[0,10,20,30,40];
v_array=[3,3,3,3,3];
%�����յ���ٶȼ���Ϊ0���м����ٶȶ���ʼ��Ϊ0��
acc_array=[0,0,0,0,0];
%����켣
%��ʼλ��
t=t_array(1);
q=q_array(1);
v=v_array(1);
v_array2=v_array;
acc=acc_array(1);

for k=1:length(t_array)-1
    %����ʽ��1-23��ʽȷ���м����ٶ�ֵ
    if(k>1)
        dk1=(q_array(k)-q_array(k-1))/(t_array(k)-t_array(k-1));
        dk2=(q_array(k+1)-q_array(k))/(t_array(k+1)-t_array(k));
        if((dk2>=0 && dk1>=0) || (dk2<=0 && dk1<=0))
            v_array2(k)=1.0/2.0*(dk1+dk2);
        else
            v_array2(k)=0;
        end  
    end
end

for k=1:length(t_array)-1
   
    %���ù�ʽ��1-25����ϵ��
    %������ζ���ʽ��ϵ��
    h(k)=q_array(k+1)-q_array(k);
    T(k)=t_array(k+1)-t_array(k);
    a0(k)=q_array(k);
    a1(k)=v_array2(k);
    a2(k)=1.0/2*acc_array(k);
    a3(k)=1.0/(2*T(k)*T(k)*T(k))*(20*h(k)-(8*v_array2(k+1)+12*v_array2(k))*T(k)+(acc_array(k+1)-3*acc_array(k))*(T(k)*T(k)));
    a4(k)=1.0/(2*T(k)*T(k)*T(k)*T(k))*(-30*h(k)+(14*v_array2(k+1)+16*v_array2(k))*T(k)+(3*acc_array(k)-2*acc_array(k+1))*(T(k)*T(k)));
    a5(k)=1.0/(2*T(k)*T(k)*T(k)*T(k)*T(k))*(12*h(k)-6*(v_array2(k+1)+v_array2(k))*T(k)+(acc_array(k+1)-acc_array(k))*(T(k)*T(k)));
    
    %���ɸ��ι켣�ܻ������ݵ�
    %�ֲ�ʱ������
    tau=t_array(k):T(k)/100:t_array(k+1);
    %ȫ��ʱ�����꣬�ɾֲ�ʱ���������
    t=[t,tau(2:end)];
    %λ��
    qk=a0(k)+a1(k)*power(tau-tau(k),1)+a2(k)*power(tau-tau(k),2)+a3(k)*power(tau-tau(k),3)+...
        a4(k)*power(tau-tau(k),4)+a5(k)*power(tau-tau(k),5);
     %ȫ��λ������
    q=[q,qk(2:end)];
    %�ٶ�
    vk=a1(k)+2*a2(k)*power(tau-tau(k),1)+3*a3(k)*power(tau-tau(k),2)+4*a4(k)*power(tau-tau(k),3)+...
        5*a5(k)*power(tau-tau(k),4);
     v=[v,vk(2:end)];
    %���ٶ�
    acck=2*a2(k)+6*a3(k)*power(tau-tau(k),1)+12*a4(k)*power(tau-tau(k),2)+20*a5(k)*power(tau-tau(k),3);
    acc=[acc,acck(2:end)];

end
%��ͼ
subplot(3,1,1)
plot(t,q,'r');
hold on
plot(t_array,q_array,'o');
 axis([0,10,-5,45])
ylabel('position')
grid on
subplot(3,1,2)
plot(t,v,'b');
hold on
plot(t_array,v_array2,'o');
axis([0,10,-20,15])
ylabel('velocity')
grid on
subplot(3,1,3)
plot(t,acc,'g');
axis([0,10,-35,35])
ylabel('acceleration')
grid on
