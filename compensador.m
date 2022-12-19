clf % Apaga o gráfico na tela.
'Sistema sem compensação' % Exibe o título.
numg=1; % Gera o numerador de G(s).
deng=poly([0 -4 -6]); % Gera o denominador de G(s).
'G(s)' % Exibe o título.
G=tf(numg,deng) % Cria e exibe G(s).
pup=input('Entre com a ultrapassagem percentual desejada ');
 % Entra ultrapassagem percentual
 % desejada.
z=-log(pup/100)/sqrt(pi^2+[log(pup/100)]^2);
 % Calcula o fator de amortecimento.
rlocus(G) % Traça o lugar geométrico das raízes
 % do sistema sem compensação.
sgrid(z,0) % Sobrepõe a reta de ultrapassagem
 % percentual desejada.
title(['LGR sem compensação com a reta de ',num2str(pup),...
'% de Ultrapassagem']) % Adiciona um título ao lugar
 % geométrico das raízes do sistema
% sem compensação
[K,p]=rlocfind(G); % Gera o ganho, K, e os polos em malha
 % fechada, p, para o ponto selecionado
% interativamente sobre o lugar
% geométrico das raízes.
'Polos em malha fechada = ' % Exibe o título.
p % Exibe os polos em malha fechada.
f=input('Entre o número do polo que é o ponto de operação ');
 % Escolhe o polo dominante do sistema
% sem compensação.
'Resumo das especificações estimadas para o ponto selecionado no'
'lugar geométrico das raízes sem compensação'
 % Exibe o título.
ponto_de_operacao = p(f) % Exibe o polo dominante sem
 % sem compensação.
ganho=K % Exibe o ganho sem compensação.

tempo_de_acomodacao_estimado=4/abs(real(p(f)));

instante_de_pico_estimado=pi/abs(imag(p(f)))
% Exibe o instante de pico sem
% compensação.
ultrapassagem_percentual_estimada=pup
% Exibe a ultrapassagem percentual
% sem compensação.
fator_de_amortecimento_estimado=z % Exibe o fator de
 % amortecimento sem compensação.
frequencia_natural_estimada=sqrt(real(p(f))^2+imag(p(f))^2)
 % Exibe a frequência natural sem
% sem compensação.
numkv=conv([1 0],numg); % Configura o numerador para
 % calcular Kv.
denkv=deng; % Configura o denominador para
 % calcular Kv.
sG=tf(numkv,denkv); % Cria sG(s).
sG=minreal(sG); % Cancela polos e zeros comuns.
Kv=dcgain(K*sG) % Exibe Kv sem compensação.
erp=1/Kv % Exibe o erro em regime permanente
 % sem compensação para uma entrada
% em rampa unitária.
'T(s)' % Exibe o título.
T=feedback(K*G,1) % Cria e Exibe T(s).
step(T) % Apresenta a resposta ao degrau do
 % sistema sem compensação.
title(['Resposta ao Degrau do Sistema sem Compensação com ',...
num2str(pup),'% de Ultrapassagem']) % Adiciona um título
 % à resposta ao degrau sem compensação.
'Pressione qualquer tecla para passar para a'
'compensação de avanço de fase' % Exibe o título.
pause
Ts=input('Entre o Tempo de Acomodação Desejado ');
 % Entra o tempo de acomodação
 % desejado
msg = ['Entre o Zero do Compensador de Avanço de Fase,'...
' (s+b). b = ']; % Armazena cadeia longa em variável.
b=input(msg); % Entra o zero do compensador de
 % avanço de fase.
done=1; % Inicializa o contador do laço.
while done==1 % Começa o laço para obter o polo do
 % compensador de avanço de fase.
msg = ['Entre um Polo de Teste para o Compensador de Avanço de'...
' Fase, (s+a). a = ']; % Armazena cadeia longa em variável.
a=input(msg); % Entra um polo de teste do para o
 % compensador.
numge=conv(numg,[1 b]); % Gera o numerador de Gc(s)G(s).
denge=conv([1 a],deng); % Gera o denominador de Gc(s)G(s).
Ge=tf(numge,denge); % Cria Ge(s)= Gc(s)G(s).
wn=4/(Ts*z); % Calcula a frequência natural
 % desejada.
clf % Apaga o gráfico na tela.
rlocus(Ge) % Traça o lugar geométrico das raízes
 % compensado com o polo de teste do
% compensador de avanço de fase.
axis([-10,10,-10,10]) % Altera os eixos do lugar
 % geométrico das raízes compensado
 % com avanço de fase.
sgrid(z,wn) 
title(['LGR Compensado com Avanço de Fase com reta de ',...
num2str(pup),'% de Ultrapassagem, Polo de Avanço de Fase em ',...
num2str(-a),' e Wn Requerido']) % Adiciona título ao
 % lugar geométrico das raízes
 % compensado com avanço de fase.
done=input('Você terminou? (s=0,n=1) ');
 % Configura o contador do laço
end % Fim do laço para obter o polo
 % do compensador.
[K,p]=rlocfind(Ge); % Gera o ganho, K, e os polos em malha
 % fechada, p, para o ponto selecionado
% interativamente sobre o lugar
 % geométrico das raízes.
'Gc(s)' % Exibe o título.
Gc=tf([1 b],[1 a]) % Exibe o compensador de avanço de
 % fase.
'Gc(s)G(s)' % Exibe o título.
Ge % Exibe Gc(s)G(s).
'Polos em malha fechada = ' % Exibe o título.
p % Exibe os polos em malha fechada
 % do sistema compensado com avanço
% de fase
f=input('Entre o número do polo que é o ponto de operação ');
 % Escolhe o polo dominante do sistema
% compensado com avanço de fase.
'Resumo das especificações estimadas para o ponto selecionado no'
'lugar geométrico das raízes compensado com avanço de fase'
 % Exibe o título.
ponto_de_operacao=p(f) % Exibe o polo dominante
 % compensado com avanço de fase.
ganho=K % Exibe o ganho compensado com
 % avanço de fase.
tempo_de_acomodacao_estimado=4/abs(real(p(f)))
 % Exibe o tempo de acomodação
 % compensado com avanço de fase.
instante_de_pico_estimado=pi/abs(imag(p(f)))
% Exibe o instante de pico compensado
 % com avanço de fase.
ultrapassagem_percentual_estimada=pup
 % Exibe a ultrapassagem percentual
% compensada com avanço de fase.
fator_de_amortecimento_estimado=z % Exibe o fator de amortecimento
 % compensado com avanço de fase.
frequencia_natural_estimada=sqrt(real(p(f))^2+imag(p(f))^2)
% Exibe a frequência natural
% compensada com avanço de fase.
s=tf([1 0],1); % Cria a função de transferência ‘s’.
sGe=s*Ge; % Cria sGe(s) para calcular Kv.
sGe=minreal(sGe); % Cancela polos e zeros comuns.
Kv=dcgain(K*sGe) % Exibe o valor de Kv compensado com
 % avanço de fase.
erp=1/Kv % Exibe o erro em regime permanente
 % compensado com avanço de fase para
% para uma entrada em rampa unitária.
'T(s)' % Exibe o título.
T=feedback(K*Ge,1) % Cria e exibe T(s) compensada com
 % avanço de fase.
'Pressione qualquer tecla para continuar e obter a resposta ao'
'degrau compensada com avanço de fase'
 % Exibe o título.
pause
step(T) % Apresenta a resposta ao degrau do
 % sistema compensado com avanço de
% fase.
title(['Resposta ao Degrau Compensada com Avanço de Fase com ',...
num2str(pup),'% de Ultrapassagem']) % Adiciona um título
 % à resposta ao degrau do sistema
% compensado com avanço de fase.
pause


