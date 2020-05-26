%example�켣�滮���ζ���ʽ������ֱ���˶������ٶȲ��ܿ���
% clc
% clear
% %�켣��������
% %ʱ��
% t0=0;
% t1=8;
% %λ�ú��ٶȣ�a��
% q0=0;
% q1=10;
% v0=0;
% v1=0;
% %���ù�ʽ��1-22����ϵ��
% h=q1-q0;
% T=t1-t0;
% a0=q0;
% a1=v0;
% a2=(3*h-(2*v0+v1)*T)/(T*T);
% a3=(-2*h+(v0+v1)*T)/(T*T*T);
% %�켣����
% t=t0:0.1:t1;
% %λ��
% q=a0+a1*power((t-t0),1)+a2*power((t-t0),2)+a3*power((t-t0),3);
% %�ٶ�
% v=a1+2*a2*power((t-t0),1)+3*a3*power((t-t0),2);
% %���ٶ�
% acc=2*a2+6*a3*power((t-t0),1);
% %��ͼ
% subplot(3,2,1)
% plot(t,q,'r');
% ylabel('position')
% grid on
% subplot(3,2,3)
% plot(t,v,'b');
% ylabel('velocity')
% grid on
% subplot(3,2,5)
% plot(t,acc,'g');
% xlabel('(a)');
% ylabel('acceleration')
% grid on
% 
% %ʱ��
% t0=0;
% t1=8;
% %λ�ú��ٶȣ�b��
% q0=0;
% q1=10;
% v0=0;
% v1=2;
% %���ù�ʽ��1-22����ϵ��
% h=q1-q0;
% T=t1-t0;
% a0=q0;
% a1=v0;
% a2=(3*h-(2*v0+v1)*T)/(T*T);
% a3=(-2*h+(v0+v1)*T)/(T*T*T);
% %�켣����
% t=t0:0.1:t1;
% %λ��
% q=a0+a1*power((t-t0),1)+a2*power((t-t0),2)+a3*power((t-t0),3);
% %�ٶ�
% v=a1+2*a2*power((t-t0),1)+3*a3*power((t-t0),2);
% %���ٶ�
% acc=2*a2+6*a3*power((t-t0),1);
% %��ͼ
% subplot(3,2,2)
% plot(t,q,'r');
% ylabel('position')
% grid on
% subplot(3,2,4)
% plot(t,v,'b');
% ylabel('velocity')
% grid on
% subplot(3,2,6)
% plot(t,acc,'g');
% xlabel('(b)');
% ylabel('acceleration')
% grid on


%example���ζ���ʽ�켣����������ӵ�·��,���ٶȲ��������м���ٶ�ȷ��
clc
clear
%�켣��������
t_array=[0,2,4,6,8];
q_array=[0,10,20,30,40];
v_array=[0,2,2,2,0];
%����켣
%��ʼλ��
t=t_array(1);
q=q_array(1);
v=v_array(1);
%������ι켣
for k=1:length(t_array)-1
    %������ζ���ʽ��ϵ��
    h(k)=q_array(k+1)-q_array(k);
    T(k)=t_array(k+1)-t_array(k);
    a0(k)=q_array(k);
    a1(k)=v_array(k);
    a2(k)=(3*h(k)-(2*v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k));
    a3(k)=(-2*h(k)+(v_array(k)+v_array(k+1))*T(k))/(T(k)*T(k)*T(k));

    %���ɸ��ι켣�ܻ������ݵ�
    %�ֲ�ʱ������
    tau=t_array(k):T(k)/100:t_array(k+1);
    %ȫ��ʱ�����꣬�ɾֲ�ʱ���������
    t=[t,tau(2:end)];
    %�ֲ�λ������
    qk=a0(k)+a1(k)*power(tau-tau(k),1)+a2(k)*power(tau-tau(k),2)+a3(k)*power(tau-tau(k),3);
    %ȫ��λ������
    q=[q,qk(2:end)];
    %�ٶ�
    vk=a1(k)+2*a2(k)*power(tau-tau(k),1)+3*a3(k)*power(tau-tau(k),2);
    v=[v,vk(2:end)];
    %���ٶ�
    acck=2*a2(k)+6*a3(k)*power(tau-tau(k),1);
    if(k==1)
        acc=2*a2(k);
    end
    acc=[acc,acck(2:end)];
end
%��ͼ
subplot(3,1,1);
h1=plot(t,q,'-r');
legend(h1,'��һ�ַ�ʽ')
hold on;
plot(t_array,q_array,'or');
axis([0,10,-5,45]);
ylabel('position')
grid on;
subplot(3,1,2);
plot(t_array,v_array,'ob');
hold on;
plot(t,v,'b');
axis([0,10,-20,15]);
ylabel('velocity')
grid on;
subplot(3,1,3);
plot(t,acc,'g');
hold on
axis([0,10,-45,45]);
ylabel('acceleration')
grid on;






%example���ζ���ʽ�켣����������ӵ�·��,���ٶȲ��������м���ٶȲ�ȷ��
%example2.8
clc
clear
%�켣��������
t_array=[0,2,4,6,8];
q_array=[0,10,20,30,40];
v_array=[0,2,2,2,0];
%����켣
%��ʼλ��
t=t_array(1);
q=q_array(1);
v=v_array(1);
v_array2=v_array;

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

%������ι켣
for k=1:length(t_array)-1
    %������ζ���ʽ��ϵ��
    h(k)=q_array(k+1)-q_array(k);
    T(k)=t_array(k+1)-t_array(k);
    a0(k)=q_array(k);
    a1(k)=v_array2(k);
    a2(k)=(3*h(k)-(2*v_array2(k)+v_array2(k+1))*T(k))/(T(k)*T(k));
    a3(k)=(-2*h(k)+(v_array2(k)+v_array2(k+1))*T(k))/(T(k)*T(k)*T(k));

    %���ɸ��ι켣�ܻ������ݵ�
    %�ֲ�ʱ������
    tau=t_array(k):T(k)/100:t_array(k+1);
    %ȫ��ʱ�����꣬�ɾֲ�ʱ���������
    t=[t,tau(2:end)];
    %�ֲ�λ������
    qk=a0(k)+a1(k)*power(tau-tau(k),1)+a2(k)*power(tau-tau(k),2)+a3(k)*power(tau-tau(k),3);
    %ȫ��λ������
    q=[q,qk(2:end)];
    %�ٶ�
    vk=a1(k)+2*a2(k)*power(tau-tau(k),1)+3*a3(k)*power(tau-tau(k),2);
    v=[v,vk(2:end)];
    %���ٶ�
    acck=2*a2(k)+6*a3(k)*power(tau-tau(k),1);
    if(k==1)
        acc=2*a2(k);
    end
    acc=[acc,acck(2:end)];
end
%��ͼ
subplot(3,1,1);
h2=plot(t,q,'--r');
legend(h2,'�ڶ��ַ�ʽ')
hold on;
plot(t_array,q_array,'^r');
axis([0,10,-5,45]);
ylabel('position')
grid on;
subplot(3,1,2);
plot(t_array,v_array2,'^b');
hold on;
plot(t,v,'--b');
axis([0,10,-20,15]);
ylabel('velocity')
grid on;
subplot(3,1,3);
plot(t,acc,'--g');
axis([0,10,-45,45]);
ylabel('acceleration')
grid on;