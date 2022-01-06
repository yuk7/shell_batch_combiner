# Combine Tool for Shell Script and Batch File
This tool combines shell script and batch files into a single file.

## How to Use
Prepare a batch file with CRLF and a shell script with LF, and execute the commands.
```
./combiner.sh [windows batch(CRLF)] [shell script(LF)] [combined file(out-mixed)]
```

## How it works
`:` is used as a label in batch files and used in a built-in command that does nothing in shell scripts.

If you run it as a shell script, the batch file part will be interpreted as here-document and it will be discarded.

If you run it as a batch file, it will be executed from the second line and will exit before the shell script line.

output sample (highlight as cmd)
```cmd
:<<___FUNC_BATCH___ ^M                                                                                      
echo Hello from Windows!^M
echo Windows version^M
ver^M
exit /b^M
___FUNC_BATCH___
echo Hello from Linux!
echo Kernel version
uname -a
```
same(highlight as shell script)
```bash
:<<___FUNC_BATCH___ ^M                                                                                      
echo Hello from Windows!^M
echo Windows version^M
ver^M
exit /b^M
___FUNC_BATCH___
echo Hello from Linux!
echo Kernel version
uname -a
```