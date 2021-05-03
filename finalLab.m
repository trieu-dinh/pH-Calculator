function [] = finalLab
global pH;
fig = figure; %code i stole form lab 10, this is the text 'pH calculator'
pH.titleText = uicontrol('style','text','units','normalized','position', [.45 .85 .1 .095],'string', 'pH Calculator for Strong Acids/Bases:','horizontalalignment','right');
%lines 6-15 are the drop down menu, this is code from the matlab
%doc page...
pH.molarityAcidEdit = uicontrol('Style','edit','position',[120 300 35 25],'units','normalized'); %the 'button' where you put your molarity Acid
pH.molarityBaseEdit = uicontrol('Style','edit','position',[120 250 35 25],'units','normalized'); %the 'button' where you put your molarity Base
pH.volumeAcidEdit = uicontrol('Style','edit','position',[120 200 35 25],'units','normalized'); %the 'button' where you put your volume Acid
pH.volumeBaseEdit = uicontrol('Style','edit','position',[120 150 35 25],'units','normalized'); %the 'button' where you put your volume Base
pH.maText = uicontrol('Style','text','String',' Molarity Acid:','position',[60 285 50 40],'units','normalized');
pH.mbText = uicontrol('Style','text','String',' Molarity Base:','position',[60 235 50 40],'units','normalized');
pH.vaText = uicontrol('Style','text','String',' Volume Acid:','position',[60 185 50 40],'units','normalized');
pH.vbText = uicontrol('Style','text','String',' Volume Base:','position',[60 135 50 40],'units','normalized');
pH.outputText = uicontrol('Style','text','String','Output: ','position',[200 250 80 80],'units','normalized');
pH.calc = uicontrol('style','pushbutton','position', [60 85 75 35],'string',' Calculate ','callback',{@selection},'units','normalized'); % the calculate button, callback to the selection function
pH.quit = uicontrol('style','togglebutton','position',[200 85 75 35],'string','Quit','units','normalized','callback',{@quitGUI}); % the button to quit the GUI
end
function [] = selection(~,~) %The selection function takes the inputted values from the edit buttons and uses them to calculate and ouput the pH
global pH;
Ma = str2double(pH.molarityAcidEdit.String);
Mb = str2double(pH.molarityBaseEdit.String);
Va = str2double(pH.volumeAcidEdit.String);
Vb = str2double(pH.volumeBaseEdit.String);
pH.calcResult = CalculatePH(Ma,Mb,Va,Vb);
pH.outputText.String = ['Output: ' num2str(pH.calcResult)];
end
function quitGUI(~,~)  %The quitGUI function exits out of the GUI when toggled.
    close(fig)
end
function [pH] = CalculatePH(Ma,Mb,Va,Vb) %CalculatePH calculates the pH for a strong acid/base dissociation
z = (Ma*Va - Mb*Vb)/(Va+Vb);
Kw = 1e-14; %equilibrium constant (water)
p =[ 1 -z -1e-14];
Hydrogen = roots(p); %quadratic formula equation to find possible answers
Hydrogenplus= max(Hydrogen); %takes only the positive, "max" root value
pH = -log10(Hydrogenplus);
end


