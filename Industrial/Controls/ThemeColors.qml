import QtQuick 2.6

QtObject {
    property color raised: "#334248"            // Фон возвышенных элементов (панели)
    property color background: "#2c393f"        // Фона окна
    property color sunken: "#212c30"            // Фон утопленных элементов (поля ввода, фон слайдеров и чекбоксов и т.д)
    property color text: "#ffffff"              // Текст (иконки и другие элементы на фоне окна, утопленных и возвышенных элементов)
    property color hover: "#3319d6c4"           // Подсветка элемента при наведении мыши
    property color border: "#2c393f"            // Цвет обводки

    property color disabled: "#5C6970"          // Неактивный цвет (штриховка на контролах, отключенные элементы

    property color control: "#5a717c"           // Фон больших управляющих элементов (кнопки)
    property color controlBorder: "#6c8693"     // Фон и обводка мелких управляющих элементов (хендлы, переключатели)
    property color line: "#805a717c"            // Линии, цвет control + 0.5 прозрачность
    property color controlText: "#ffffff"       // Текст кнопки

    property color tip: "#009688"               // Фон подсказки
    property color tipText: "#ffffff"           // Текст подсказки

    property color selection: "#009688"         // Фон выделения
    property color selectedText: "#ffffff"      // Текст выделения

    property color highlight: "#19d6c4"         // Фон подсветки (при активации)
    property color highlightedText: "#000000"   // Текст подсветки

    property color description: "#899ea9"       // Вспомогательный текст
    property color link: "#51a0e7"              // Ссылка (на фоне окна, утопленных и возвышенных элементов)
    property color positive: "#86c34a"          // Позитивный (текст и предупреждения)
    property color neutral: "#ff9800"           // Нейтральный (текст и предупреждения)
    property color negative: "#e53535"          // Негативный (текст и предупреждения)
    property color shadow: "#80000000"          // Тень

    property color fileIcon: "#eabf3f"          // Иконка файла (FileBrowser)
}
