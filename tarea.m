% @LeslieBrenes #143851
%--n?mero que quiero comprobar--
    num = 5.125;
%------------------------------
% Bits expontente, mantisa
bexp=4;
bman=5;

% calculo el exceso del exponente
exc = 2^(bexp-1)-1;

% calculo el n?mero m?s peque?o y m?s grande que puedo representar (en abs)
esp=2^-exc;
may=2^(exc+1)*(2^(bman+1) - 1)/2^bman;

% Creo mis arrays iniciales
s = zeros(1,1);
e = zeros(1,bexp);
m = zeros(1,bman);

if(num==0)
    text=[num2str(num),' si se puede representar'];
    disp(text);
    disp('De esta forma: ')
    rep=[num2str(s),'  |  ',num2str(e),'  |  ',num2str(m) ,'  |  '];
    disp(rep);
else
    if(num>0)
        s(1,1) = 0;
        x=num;
    else
        s(1,1) = 1;
        x = abs(num);
    end
    if (x>may | x<esp)
        text=[num2str(num),' no se puede representar'];
        disp(text);
    else
        r=x/(2^-7);
        if (floor(r)-r==0)
            cont = 0;
            while(r>=2)
                cont=cont+1;
                r=r/2;
            end
            e = int32(sscanf(dec2bin(cont,bexp),'%1d'))';
            
            r = r-1;
            i=1;
            while(r~=1 && i<=bman)
                r=r*2;
                if(r-1>=0)
                    r=r-1;
                    m(i)=1;
                else
                    m(i)=0;
                end
                i=i+1;
            end
            text=[num2str(num),' si se puede representar'];
            disp(text);
            disp('De esta forma: ')
            rep=[num2str(s),'  |  ',num2str(e),'  |  ',num2str(m) ,'  |  '];
            disp(rep);
            %Convertir a codigo Grey
            g=0;
            g(1)=m(1);
            for c=2:bman
                g(c)=xor(m(c-1),m(c));
            end
            
            disp('Con la mantisa en codigo Grey: ')
            rep=[num2str(s),'  |  ',num2str(e),'  |  ',num2str(g) ,'  |  '];
            disp(rep);
        else
            text=[num2str(num),' no se puede representar'];
            disp(text);
        end
    end
end
