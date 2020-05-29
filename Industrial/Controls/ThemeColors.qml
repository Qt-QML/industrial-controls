import QtQuick 2.6

QtObject {
    property color background: "#212b30"        // Фона окна
    property color sunken: "#2c393f"            // Фон утопленных элементов (поля ввода, фон слайдеров и чекбоксов и т.д)
    property color raised: "#37474f"            // Фон возвышенных элементов (панели)
    property color text: "#ffffff"              // Текст (иконки и другие элементы на фоне окна, утопленных и возвышенных элементов)
    property color hover: "#16ffffff"           // Подсветка элемента при наведении мыши
    property color border: "#2c393f"            // Цвет обводки

    property color disabled: "#161c20"          // Неактивный цвет (штриховка на контролах, отключенные элементы

    property color control: "#4d636f"           // Фон кнопки (а так же хэндлов свичей и слайдеров)
    property color controlText: "#ffffff"       // Текст кнопки

    property color tip: "#009688"               // Фон подсказки
    property color tipText: "#ffffff"           // Текст подсказки

    property color selection: "#009688"         // Фон выделения
    property color selectedText: "#000000"      // Текст выделения

    property color highlight: "#19d6c4"         // Фон подсветки (при активации)
    property color highlightedText: "#000000"   // Текст подсветки

    property color link: "#51a0e7"              // Ссылка (на фоне окна, утопленных и возвышенных элементов)
    property color positive: "#86c34a"          // Позитивный (текст и предупреждения)
    property color neutral: "#ff9800"           // Нейтральный (текст и предупреждения)
    property color negative: "#e53535"          // Негативный (текст и предупреждения)
    property color shadow: "#80000000"          // Тень
}
