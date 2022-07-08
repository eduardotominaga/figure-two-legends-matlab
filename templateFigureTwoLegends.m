%% Reset
clearvars;
close all;
clc;

%% Parameters
EbN0_dB=0:1:10;     % Ratio of bit to noise PSD [dB]

%% Generating the BER curves

BER_4PAM=berawgn(EbN0_dB,'pam',4,'nondiff');
BER_8PAM=berawgn(EbN0_dB,'pam',8,'nondiff');
BER_16PAM=berawgn(EbN0_dB,'pam',16,'nondiff');

BER_QPSK=berawgn(EbN0_dB,'psk',4,'nondiff');
BER_8PSK=berawgn(EbN0_dB,'psk',8,'nondiff');
BER_16PSK=berawgn(EbN0_dB,'psk',16,'nondiff');

%% Plotting the curves
fig1=figure(1);

    % Define position and size of the figure:
    set(fig1,'Position',[300 300 600 500])
    
    % Plot the curves and associate objects to them:
    % (Note that the curve pAux1 is a copy of the curve p1!)
    p1=semilogy(EbN0_dB,BER_4PAM,'b-o','LineWidth',1.5,'MarkerSize',7.5);
    hold
    pAux1=semilogy(EbN0_dB,BER_4PAM,'b-o','LineWidth',1.5,'MarkerSize',7.5);
    p2=semilogy(EbN0_dB,BER_8PAM,'k-o','LineWidth',1.5,'MarkerSize',7.5);
    p3=semilogy(EbN0_dB,BER_16PAM,'r-o','LineWidth',1.5,'MarkerSize',7.5);
    p4=semilogy(EbN0_dB,BER_QPSK,'b-s','LineWidth',1.5,'MarkerSize',7.5);
    p5=semilogy(EbN0_dB,BER_8PSK,'k-s','LineWidth',1.5,'MarkerSize',7.5);
    p6=semilogy(EbN0_dB,BER_16PSK,'r-s','LineWidth',1.5,'MarkerSize',7.5);
    grid on
    
    % Set the fonts for the axes and labels of the axes:
    set(gca,'TickLabelInterpreter','latex','FontSize',14)
    xlabel('$E_b/N_0$ [dB]','Interpreter','latex','FontSize',14)
    ylabel('BER','Interpreter','latex','FontSize',14)

    % Create the first legend:
    leg=legend([p1 p2 p3],'$M=4$','$M=8$','$M=16$');
    set(leg,'Interpreter','latex','FontSize',14,'Location','southwest')
    
    % Create new (invisible) axes:
    newAxes=axes('position',get(gca,'position'),'visible','off');
    
    % Create the second legend:
    leg2=legend(newAxes,[pAux1 p4],'PAM','PSK');
    set(leg2,'Interpreter','latex','FontSize',14,'Location','West')
    
    % Save the figure:
    saveas(fig1,'Figure.png')
    saveas(fig1,'Figure.eps','epsc')
    