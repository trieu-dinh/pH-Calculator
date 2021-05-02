function [] = finalLab
    global pH;
    pH = figure('numbertitle','off','name','Ph Calculator'); %code i stole form lab 10, this is the text 'pH calculator'
    pH = uicontrol('style','text','units','normalized','position', [.45 .85 .1 .095],'string', 'pH Calculator for Strong Acids/Bases:','horizontalalignment','right');
    %lines 6-15 are the drop down menu, this is code from the matlab
    %doc page...  
    pH.Callback = @selection;
    function selection(~,event)
        val = pH.Value;
        str = pH.String;
        str{val};
        disp(['Selection: ' str{val}]);
    end
    pH = uicontrol('Style','edit'); %the 'button' where you put your molarity Acid
    pH.Position = [120 300 35 25];
    uicontrol(pH);
    pH = uicontrol('Style','edit'); %the 'button' where you put your molarity Base
    pH.Position = [120 250 35 25];
    uicontrol(pH);
    pH = uicontrol('Style','edit'); %the 'button' where you put your volume Acid
    pH.Position = [120 200 35 25];
    uicontrol(pH);
    pH = uicontrol('Style','edit'); %the 'button' where you put your volume Base
    pH.Position = [120 150 35 25];
    uicontrol(pH);
    ma = uicontrol('Style','text','String',' Molarity Acid:'); 
    ma.Position = [60 285 50 40];
    mb = uicontrol('Style','text','String',' Molarity Base:'); 
    mb.Position = [60 235 50 40];
    va = uicontrol('Style','text','String',' Volume Acid:'); 
    va.Position = [60 185 50 40];
    vb = uicontrol('Style','text','String',' Volume Base:'); 
    vb.Position = [60 135 50 40];
    calc.Position = uicontrol('style','pushbutton','position', [60 85 75 35],'string',' Calculate '); % the calculate button
end
    function [] = CalculatePH() %CalculatePH calculates the pH for a strong acid/base dissociation
        Ma = input('Enter the Molarity of the acid >');
        Mb = input('Enter the Molarity of the base >');
        Va = input('Enter the volume of acid used >');
        Vb = input('Enter the volume of base used >');
        z = (Ma*Va - Mb*Vb)/(Va+Vb);
        Kw = 1e-14; %equilibrium constant (water)
        p =[ 1 -z -1e-14];
        Hydrogen = roots(p); %quadratic formula equation to find possible answers
        Hydrogenplus= max(Hydrogen); %takes only the positive, "max" root value
        pH = -log10(Hydrogenplus);
        if  pH>7 && pH<=14
            f = msgbox(sprintf('The pH of the solution is = %.3f',pH))
        elseif pH>=1 && pH<=7
            f = msgbox(sprintf('The pH of the solution is = %.3f',pH))
        else
            f =  msgbox(sprintf('sorry, input cannot be possible'))
        end
    end


