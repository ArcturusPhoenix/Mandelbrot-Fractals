# ArcturusPhoenix Fractals
Discover the depths of the Mandelbrot fractal and find your unique, fascinating and beautiful patterns.

## List of projects:

### [1] Experimental Mandelbrot Console
A Delphi-Pascal console application for Windows to generate Mandelbrot fractals and then save the visualization as a PPM file (Portable Pixmap Format).
- Delphi-Pascal 7 console application
- No entries required
- Iterations and resolution not adjustable (hard coded)
- Internal project name: Mandelbrot PPM Generator

**Note:** It is recommended to create a custom batch file that opens the executable of the project in order to adjust the size of the console window correctly. Otherwise it could lead to minor problems.
```v
@echo off
mode con: cols=148 lines=30
EMC.exe
```

![](https://cdn.discordapp.com/attachments/869754580261568532/1197078495667441684/1.png)

------------

### [2] Experimental Mandelbrot Fractals
A Delphi-Pascal Visual Component Library (VCL) application with user interface to visualize the Mandelbrot fractal on a bitmap.
- Delphi-Pascal 7 VCL application
- Singlethread rendering
- Adjustable iterations and resolution

![](https://cdn.discordapp.com/attachments/869754580261568532/1197078495419961464/2.png)

------------

### [3] Koch Snowflake Fractals
A Delphi-Pascal Visual Component Library (VCL) application with user interface that calculates and visualizes the Koch Snowflake (originating from the Koch Curve) and its opposite, the Anti Snowflake (Anti Koch Snowflake). The drawn image can be saved and exported as a PNG image file.
- Delphi-Pascal 11 (RAD Studio 11.3) VCL application
- Singlethread rendering
- Adjustable iterations and resolution
- Saving images as PNG file
- Logic for counting the corners of the fractal (up to level 6)

![](https://cdn.discordapp.com/attachments/869754580261568532/1197078495080235068/3.png)

------------

| Feature | Experimental Mandelbrot Console | Experimental Mandelbrot Fractals | Koch Snowflake Fractals | ArcturusPhoenix Fractals |
| :- | :-: | :-: | :-: | :-: |
| Singlethreaded CPU | **✓** | **✓** | **✓** | **✓** |
| Multithreaded CPU |  |  |  | **✓** |
| Export images | **✓** |  | **✓** | **✓** |
| Adjustable calculation values |  | **✓** | **✓** | **✓** |
| Color |  | **✓** |  | **✓** |
| List multiple fractals |  |  | **✓** | **✓** |
| Animations |  |  |  | **✓** |
| 3D fractals |  |  |  | **✓** |
| Color |  |  |  | **✓** |
| Zoom |  |  |  | **✓** |
| Deep Zoom |  |  |  | **✓** |
| GPU |  |  |  | **✓** |
| Fractal shifting |  |  |  | **✓** |
|  | Free | Free | Free | Unobtainable |

## Fractal formulas:
The following mathematical formulas were used to calculate the fractals. The code was altered and modified accordingly in order to achieve improved rendering and computing performance.

### The Mandelbrot formula
**Original functional formula according to Benoît Mandelbrot:**
$$f(z)=z2+c$$
In the Mandelbrot set, different c values are considered in order to investigate which points in the complex plane lie in the Mandelbrot set and which do not. Points in the set have a finite iteration sequence, while points outside the set diverge towards infinity.

### The Koch Snowflake & Curve formula
**The Koch curve can be calculated conditionally as follows:**
$$F_n(x, y) = \frac{1}{3} F_{n-1}(x, y) + \frac{1}{3} R_{60} \left(F_{n-1}(x, y)\right) + \frac{1}{3} F_{n-1}\left(F_{n-1}(x, y)\right)$$
If F is the function that transforms a line into the Koch curve, then the Koch curve can be seen as the union of three such curves.

**And the Koch snowflake can be calculated using this formula:**
$$F_n(x, y) = \frac{1}{3} F_{n-1}(x, y) + \frac{1}{3} R_{60}\left(F_{n-1}(x, y)\right) + \frac{1}{3} F_{n-1}(x', y') + \frac{1}{3} R_{60}\left(F_{n-1}(x', y')\right)$$
This formula represents the recursive process in which each section of the line is replaced by the pattern of the Koch curve. Repeated application of this formula produces the detailed Koch snowflake.

------------

## Terms and conditions of use:
All files of the projects in this repository are free to use for private purposes only.
This includes the graphical structure and the names of the applications.
However, this does not apply to the formulas of the fractals and the calculation method as code.

**Modifying and changing the code is permitted as long as no further publication without clear reference to this repository, no financial income and benefits are generated, or advertising is made.**

- [x] By downloading and using these project files you automatically and immediately agree and confirm that you have read the readme and the terms of use.
In case of violation, we will take immediate action and initiate further legal measures.
