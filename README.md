# Emily Shell

## *Overview*
Creates a C file and compiled binary for the text file passed in with escape handling for ASCSI art. Recreates "c_file" and "out_file" files on each run. Originally created for my daughter to run from her Pinebook Pro while at the table *(btw, she uses arch)*

## *Usage*
1. Create txt file within same directory as "create.sh"
2. Modify "c_file" variable with the desired output C file
3. Modify "out_file" variable with the desired executable name
4. Run create.sh ("chmod +x ./create.sh" if executable error)
5. Run the "./*out_file*"

## *Notes*
- Hardcoded with GCC compiler within create.sh.  Modify if different compiler being used
- Will run under WSL/WSL2 for Windows but would need to be refactored as a  batch file as well as adding ```echo "#include <windows.h>" >> $c_file```
- The sleep timer can be adjusted as needed for different effects