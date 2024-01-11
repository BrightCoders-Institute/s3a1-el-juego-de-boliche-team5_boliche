
![BrightCoders Logo](img/logo.png)

# Juego del Boliche

## 📓 Descripción
Programa para simular la realización de partidas aleatorias de boliche, desglosando por cada frame los tiros efectuados y puntajes acumulados.

## 📋 Tabla de contenido
- Tecnologías.
- Cómo instalar y ejecutar el proyecto.
- Cómo ejecutar las pruebas del proyecto.
- Cómo ejecutar RuboCop en el proyecto.
- Cómo ejecutar Reek en el proyecto.
- Cómo ejecutar RubyCritic en el proyecto.
- Créditos.
- Badges.

## 🔧 Tecnologías
- Ruby.
- Minitest.
- RuboCop.
- Reek.
- RubyCritic.

## ⚙️ Cómo instalar y ejecutar el proyecto
>_**1.** Verificar que Ruby se encuentre instalado en el sistema._
>```
>$ ruby -v
>   ruby 3.2.2-1 (set by C:\Ruby-on-Windows\global.txt)
>```
>
>_**2.** Clonar o descargar el repositorio._
>```
>$ git clone https://github.com/BrightCoders-Institute/s3a1-el-juego-de-boliche-team5_boliche.git
>```
>
>_**3.** Desplazarse al directorio del proyecto._
>```
>$ cd <ruta_directorio>
>```
>
>_**4.** Ejecutar el archivo "main.rb" desde una terminal de comandos._
>```
>$ ruby .\src\main.rb
>
>   ||--------------- Frame 01 --------------||
>   || Tiro no. 01 -----> 04                 ||
>   || Tiro no. 02 -----> 04                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 008                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 02 --------------||
>   || Tiro no. 01 -----> 05                 ||
>   || Tiro no. 02 -----> 02                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 015                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 03 --------------||
>   || Tiro no. 01 -----> 05                 ||
>   || Tiro no. 02 -----> 01                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 021                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 04 --------------||
>   || Tiro no. 01 -----> 06                 ||
>   || Tiro no. 02 -----> 04 (spare)         ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 034                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 05 --------------||
>   || Tiro no. 01 -----> 03                 ||
>   || Tiro no. 02 -----> 02                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 039                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 06 --------------||
>   || Tiro no. 01 -----> 10 (strike)        ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 058                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 07 --------------||
>   || Tiro no. 01 -----> 05                 ||
>   || Tiro no. 02 -----> 04                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 067                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 08 --------------||
>   || Tiro no. 01 -----> 01                 ||
>   || Tiro no. 02 -----> 03                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 071                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 09 --------------||
>   || Tiro no. 01 -----> 10 (strike)        ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 090                ||
>   ||---------------------------------------||
>
>   ||--------------- Frame 10 --------------||
>   || Tiro no. 01 -----> 04                 ||
>   || Tiro no. 02 -----> 05                 ||
>   ||---------------------------------------||
>   || Puntaje obtenido = 099                ||
>   ||---------------------------------------||
>```

## 🔬 Cómo ejecutar las pruebas del proyecto
>_**1.** Instalar las gemas de Minitest y ffi._
>```
>$ gem install minitest
>   Successfully installed minitest-5.20.0
>   Parsing documentation for minitest-5.20.0
>   Couldn't find file to include 'README.rdoc' from lib/minitest.rb
>   Done installing documentation for minitest after 2 seconds
>   1 gem installed
>
> $ gem install ffi
>   Successfully installed ffi-1.16.3-x64-mingw-ucrt
>   Parsing documentation for ffi-1.16.3-x64-mingw-ucrt
>   Done installing documentation for ffi after 1 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar directamente desde el directorio del proyecto el archivo con las pruebas unitarias._
>```
>$ ruby .\test\juego_boliche_test.rb
>   Run options: --seed 27205
>
>   # Running:
>
>   ............
>
>   Finished in 0.040776s, 196.1958 runs/s, 515.0139 assertions/s.
>
>   8 runs, 21 assertions, 0 failures, 0 errors, 0 skips
>```

## 🔍 Cómo ejecutar RuboCop en el proyecto
>_**1.** Instalar la gema de RuboCop._
>```
>$ gem install rubocop
>   rbenv: Rehash executable 'rubocop' for gem 'rubocop'
>   Successfully installed rubocop-1.59.0
>   Parsing documentation for rubocop-1.59.0
>   Done installing documentation for rubocop after 14 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar RuboCop en el directorio del proyecto._
>```
>$ rubocop
>   Inspecting 23 files
>   .......................
>   
>   9 files inspected, no offenses detected
>
>$ rubocop -L
>   Gemfile
>   src/frame/frame.rb
>   src/frame/ultimo_frame.rb
>   src/main.rb
>   src/motor_juego/juego_boliche.rb
>   src/tiro/spare.rb
>   src/tiro/strike.rb
>   src/tiro/tiro.rb
>   test/juego_boliche_test.rb
>```

## 🧩 Cómo ejecutar Reek en el proyecto
>_**1.** Instalar la gema de Reek._
>```
>$ gem install reek
>   rbenv: Rehash executable 'code_climate_reek' for gem 'reek'
>   rbenv: Rehash executable 'reek' for gem 'reek'
>   Successfully installed reek-6.2.0
>   Parsing documentation for reek-6.2.0
>   Done installing documentation for reek after 4 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar Reek en el directorio de la aplicación._
>```
>$ cd .\src\ 
>$ reek
>   Inspecting 7 file(s):
>   SS.S..S
>   ...
>```
>
>_**3.** Ejecutar Reek en el directorio de las pruebas._
>```
>$ cd .\test\ 
>$ reek
>   Inspecting 1 file(s):
>   S
>   ...
>```

## 🛠️ Cómo ejecutar RubyCritic en el proyecto
>_**1.** Instalar la gema de RubyCritic._
>```
>$ gem install rubycritic
>   rbenv: Rehash executable 'rubycritic' for gem 'rubycritic'
>   Successfully installed rubycritic-4.9.0
>   Parsing documentation for rubycritic-4.9.0
>   Done installing documentation for rubycritic after 3 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar RubyCritic en el directorio de la aplicación._
>```
>$ cd .\src\ 
>$ rubycritic
>   running flay smells
>   
>   running flog smells
>   .......
>   running reek smells
>   .......
>   running complexity
>   .......
>   running attributes
>   .......
>   running churn
>   .......
>   running simple_cov
>   .......
>   New critique at file:///C:/Users/erikg/Desktop/s3a1-el-juego-de-boliche-
>   team5_boliche/src/tmp/rubycritic/overview.html
>   Score: 91.65
>```
>
>_**3.** Ejecutar RubyCritic en el directorio de las pruebas._
>```
>$ cd .\test\ 
>$ rubycritic
>   running flay smells
>   .
>   running flog smells
>   .
>   running reek smells
>   .
>   running complexity
>   .
>   running attributes
>   .
>   running churn
>   .
>   running simple_cov
>   .
>   New critique at file:///C:/Users/erikg/Desktop/s3a1-el-juego-de-boliche-
>   team5_boliche/test/tmp/rubycritic/overview.html
>   Score: 76.11
>```

## 🕹️ Créditos
- **[ErikGmz](https://github.com/ErikGmz)**
- **[luiandre13](https://github.com/luiandre13)**
- **[SharonBel7](https://github.com/SharonBel7)**

## 💻 Badges
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
