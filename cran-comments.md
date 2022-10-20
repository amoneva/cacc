## Test environments

* Local Windows 10 Enterprise, R 4.2.0, 64 bit
* macOS 10.13.6 High Sierra, R-release, brew (via `rhub`)
* Windows Server 2022, R-release & R-devel, 32/64 bit (via `rhub`)


## R CMD check results

There were no ERRORs or WARNINGs.

There were 2 NOTEs:

```
❯ checking CRAN incoming feasibility ... [13s] NOTE
  Maintainer: 'Asier Moneva <amoneva@nscr.nl>'
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    CACC (10:117, 10:356)
    Miethe (10:124)
    Regoeczi (10:140)
```

The possibly misspelled words are correct.

```
❯ checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'
```
This NOTE was only found on the Local Windows environment. As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this could be due to a bug/crash in MiKTeX and can likely be ignored.

## Downstream dependencies

There are currently no downstream dependencies for this package.
