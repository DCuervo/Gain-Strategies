function saveData(out_dir, fileName, IDT, IDI, IDD)
[~, C] = size(IDI);

% Write out information
disp('Writing output file...');
xlswrite([out_dir fileName], IDT, 1, 'A1');
if C == 0
    xlswrite([out_dir fileName], IDD, 1, 'A2');
else
    xlswrite([out_dir fileName], IDI, 1, 'A2');
    switch C
        case 1
            xlswrite([out_dir fileName], IDD, 1, 'B2');
        case 2
            xlswrite([out_dir fileName], IDD, 1, 'C2');
        case 3
            xlswrite([out_dir fileName], IDD, 1, 'D2');
        case 4
            xlswrite([out_dir fileName], IDD, 1, 'E2');
    end
end
end

