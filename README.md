# xpo2dox

A Microsoft Dynamics AX 4.0 [XPO file](https://docs.microsoft.com/en-us/dynamicsax-2012/developer/how-to-export-application-objects-by-using-the-aot?redirectedfrom=MSDN) preprocessor for [Doxygen](https://www.doxygen.nl/helpers.html)

## About

[Doxygen](https://www.doxygen.nl) generates source code documentation from annotated source code files. It supports multiple programming languages. However, Microsoft Dynamics AX 4.0 has been missing until today.

The script [xpo2dox](xpo2dox) acts as an [INPUT_FILTER](https://www.doxygen.nl/manual/config.html#cfg_input_filter) for [Doxygen](https://www.doxygen.nl). It takes the raw [XPO file](https://docs.microsoft.com/en-us/dynamicsax-2012/developer/how-to-export-application-objects-by-using-the-aot?redirectedfrom=MSDN) from `stdin` and converts it to something, that [Doxygen](https://www.doxygen.nl) can interpret as C# code for documentation purpose.

[xpo2dox](xpo2dox) is an [awk](https://www.gnu.org/software/gawk/manual/gawk.html) script not using the GNU extensions.

## Thanks

Thanks to Dimitri van Heesch and all the contributors for maintaining [Doxygen](https://www.doxygen.nl) since 1997. Your tool has brought so much value to me for many many years! ❤️

## Usage

If you have `doxygen` on your search path, then you can just enter

```shell
doxygen
```

in the cloned working directory.

This will run doxygen on the files in the [test](test) folder. Output will be generated in a new folder called `html`. Open `html/index.html` to check the generated documentation. Look into [Doxyfile](Doxyfile) to see how this script is configured. See the configuration parameters `INPUT_FILTER` and `EXTENSION_MAPPING`.

## Note

[xpo2dox](xpo2dox) is not a converter. The output is not valid C# code. The goal is to generate documentation from XPO files.

## Links

- [Doxygen](https://www.doxygen.nl) ([Github Repository](https://github.com/doxygen/doxygen))
- [XPO file](https://docs.microsoft.com/en-us/dynamicsax-2012/developer/how-to-export-application-objects-by-using-the-aot?redirectedfrom=MSDN)
- [Awk](https://www.grymoire.com/Unix/Awk.html) - an awk tutorial.
- [The GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html) - the official user guide for GNU awk.
