# Автомат для прохода в метро
## Описание
S0 – начальное состояние.

S1 – ожидание карты. Индикация «_». Приложенная карта включает счетчик тактов. Сигнал, имитирующий это действие, получаем с тумблера Т1. Через 2 такта автомат переходит в состояние S2 – чтение состояния карты.

S2 – чтение карты. Время удержания 2 такта. Состояние карты имитируется положением тумблеров, определяющих баланс карты.  Состояние выхода автомата «__». Переход в S3.

S3 – индикация состояния карты.  Автомат выводит в течение 3 тактов состояние остатка на балансе при вычете тарифа. После этого автомат переходит в состояние S4 или S1(если баланс меньше тарифа). 

S4 – вход разрешен. Тумблер Т1 выключить. Состояние выхода GO (турникет открыт). Время удержания 4 такта. Переход в S1

## Состояния автомата
+	RES (s0) – сброс
+	WAIT (s1) – ожидание карты 
+	CARD_READ_T1 (s2) – чтение карты
+	BALANCE_OUT (s3) – проверка баланса, отображение остатка 
+	GO (s4) – GO вход разрешен / nO проход запрещен
## Описание блоков
+	coder - преобразует четырехразрядные числа в семиразрядные для семи сегментного индикатора.
+	count_div2 - понижает частоту счётчика в 25 миллионов раз
+	moore_lab - реализуют логику работы конечного автомата по работе турникета метро
+	all - объединяет в себе вышеперечисленные блоки образуя готовый продукт

## Граф работы конечного автомата
<img src="https://user-images.githubusercontent.com/78417431/218448314-11bb35c0-4995-4993-861c-a206893e68da.png" width="300">
