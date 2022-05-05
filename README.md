[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
# MIPT SE M3i versions for time measure

## Как пользоваться

### Сборка

Всё как обычно

```bash
$ cmake -S . -B build
$ cmake --build build
```

### Артефакты сборки

В папке `build/` появились файлы `rel0`, `rel1`...
Каждый из низ них умеет запускать измерение времени для каждой реализации

```bash
Usage: ./build/rel0 <size> <times> <fill>
where
        <size> - size of cube
        <times> - times measure
        <fill> - if <fill> == -1 then
                        call M3i(int, int, int)
                else
                        call M3i(int, int, int, <fill>)
                fi
```

То же самое, но на русском:

* \<size\> - размер ребра куба
* \<times\> - количество измерений
* \<fill\> - параметр-ключ для вызова конструктора.
  Если \<fill\> равен -1, то вызывается незаполняющий конструктор
  Иначе вызывается конструктор с заполнением всего тензора значением \<fill\>

### Как именно использовать

Проявляем всю доступную магию для составления собственного отчета

(или используем скрипты, которые, возможно, тут позже появятся)

## Как добавить реализацию

1. Находим в папке `src/rels` первый свободный номер (допустим 5)

2. Открываем файл `m3i.h` и прописываем комментарий с особенностями этой реализации (+ желательно автора)

   ```c++
   /*
    * Специально замедленная версия от slowpoke
    */
   ```

   

3. Переименовываем `m3i.h` и `m3i.cpp` в `m3i_5.h` и `m3i_5.cpp` и перемещаемих в папку `src/rels`

4. Открываем `src/m3i/m3i.h` и добавляем в конец следующие строчки:

   ```c++
   #ifdef REL5
   #include <m3i_5.h>
   #endif
   ```

   Открываем `CMakeLists.txt` и добавляем свою библиотеку и исполняемый файл:

   ```cmake
   add_library(m3i5 src/rels/m3i_5.cpp)
   target_compile_definitions(m3i5 PUBLIC -DREL5)
   // ...
   add_executable(rel5 src/rels/m3i/m3i.h src/measure/measure.cpp)
   target_link_libraries(rel5 m3i5)
   
   ```

5. Делаем коммит и пуш в _master_ (шаг обязателен! там лицензия!:) )

6. Done!
