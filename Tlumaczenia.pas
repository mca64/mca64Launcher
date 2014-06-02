unit Tlumaczenia;

interface

type
  TJezyk = packed record
    AV2, AV3, AV4, AV5, AV6, AV7, glosnosc, f1, pause, altshift, zagubione, zapora, znaki, skrin, sprawdzLatency, daneKonta,
      ustawieniaCzatu, ustawieniaStrumnieniowania, ustawieniaKonta, ustawGre, ustawOpis, listaWidzow, Pogrubienie, bnCzat,
      sprawdzanieAktualizacji, nagrywajLokalnie, caps, jump, wyswietl, funkcje, kbHook, listStrumieni, guiUniemozliwi, listaGraczy,
      jKoreanski, track, au1, au2, au3, sekundy, dyskTwardy, wysylanieWToku, zakonczoneNiepo, wybierzAkcje, uprawienia, tymczasowyBan,
      zbanuj, cofUpr, listaOP, odbanuj, pobierzKlucz, priorytet, trwaPobieranieKlucza, opuscil, dolaczyl, polaczono, rozlaczono, fishiInne,
      naprawKolory, emulacjaDD, upnp, bramki, wmode, start, powiadomienie, jezyk, pokazLog, sprawdzTrase, pokazKraj, hosty, pokazKlucz,
      startCam, stopCam, lobby, lobbyPrzed, wGrze, odtwarzajDz, kanal, polacz, polaczony, rozlacz, konfiguruj, liczbaWidzow, pokazCzas,
      pokazWeWy, wyslij, rozne, nagrywanie, dotacje, oProgramie, uVideo, uAudio, kodekVideo, kodekAudio, podglad, nagrywaj, tLogin, tHaslo,
      domyslnyKanal, zapiszCzat, autoPolaczenie, zapisz, maxBitrate, rodzajPrzeplywnosci, stala, zmienna, przeplywnosc, kanaly,
      czestoliwosc, wartosc, predkosc, overlay, czasGry, czas, trybObs, czatTwitcha, apm, winamp, autoreplay, ukryjPasek, usunLimit,
      wyswietlZdjecie, autor, kontakt, dataBuildu, wersja, podziekowania, wykorzystano, logowanie, dodaj, usun, zapisujCzatBn, czcionka,
      czcionkaDomyslna, otworzKatalog, aero, trwaNagrywanie, wiadomosci, jednAt, jednPrzy, rasa, jednostka, upAtak, upArmory, oblicz,
      obrazenia, kalkulator, aktywuj, blokada, wsparciePolski, update, update2, schowek, dialog_uruchomiona, lossless, streamin,
      opoznienie: string;
  end;

const
  /// /////////////////////////////   POLISH
  polski: TJezyk = (AV2: 'Czas:'; AV3: 'Rozmiar:'; AV4: 'Pominięte klatki:'; AV5: 'Przepływność bitów:'; AV6: 'Klatki na sekundę:';
    AV7: 'Wysyłanie:'; glosnosc: 'Kontrola głośności (CTRL + GÓRA/DÓŁ)'; f1: 'Zablokuj klawisz F1';
    pause: 'Klawisz PAUSE do pauzy/wznowienia gry'; altshift: 'Zablokuj klawisze ALT + SHIFT';
    zagubione: 'Napraw "zagubione" wciśnięcia klawiszy'; zapora: 'Dodanie wyjątku w zaporze Windows'; znaki: 'Zmiana zestawu znaków';
    skrin: 'Zrzut ekranu (CTRL + ALT + P)'; sprawdzLatency: 'Sprawdzenie opóźnień'; daneKonta: 'Dane konta:';
    ustawieniaCzatu: 'Ustawienia czatu:'; ustawieniaStrumnieniowania: 'Ustawienia strumieniowania:'; ustawieniaKonta: 'Ustawienia kanału:';
    ustawGre: 'Ustaw grę: "StarCraft: Brood War"'; ustawOpis: 'Ustaw opis:'; listaWidzow: 'Lista widzów'; Pogrubienie: 'Pogrubienie';
    bnCzat: 'Czat Battle.net'; sprawdzanieAktualizacji: 'Sprawdzanie dostępności aktualizacji'; nagrywajLokalnie: 'Nagrywaj lokalnie';
    caps: 'Zablokuj klawisz CAPS LOCK'; jump: 'Winamp - przejdź do pliku'; wyswietl: 'Wyświetl w grze:'; funkcje: 'Funkcje:';
    kbHook: 'Podpięcie się pod klawiaturę'; listStrumieni: 'Aktualizowanie listy strumieni';
    guiUniemozliwi: 'GUIfixes uniemożliwi Ci wejście na serwery Blizzarda!'; listaGraczy: 'Lista graczy';
    jKoreanski: 'Wsparcie dla języka koreańskiego w grze'; track: 'Informacje o utworze';
    au1: 'OAuth dla konkretnego konta należy wygenerować tutaj:'; au2: 'Powinno to wyglądać mniej więcej tak: ';
    au3: 'następnie całość wkleić do pola.'; sekundy: 'sekund'; dyskTwardy: 'Zapisz również na dysku twardym';
    wysylanieWToku: 'Strumieniowanie na Twitch...'; zakonczoneNiepo: 'Strumieniowanie na Twitch zostało przerwane';
    wybierzAkcje: 'Wybierz akcję dla użytkownika '; uprawienia: 'Przyznaj uprawnienia'; tymczasowyBan: 'Tymczasowy ban'; zbanuj: 'Zbanuj';
    cofUpr: 'Pozbaw uprawnień'; listaOP: 'Pokaż listę operatorów kanału'; odbanuj: 'Cofnij bana';
    pobierzKlucz: 'Pobierz klucz i zapisz ustawienia'; priorytet: 'Wyższy priorytet dla StarCraft''a';
    trwaPobieranieKlucza: 'Pobieranie klucza...'; opuscil: 'Opuścił:'; dolaczyl: 'Dołączył:'; polaczono: 'Połączono z';
    rozlaczono: 'Rozłączono z'; fishiInne: 'Fish i inne'; naprawKolory: 'Naprawa kolorów'; emulacjaDD: 'Emulacja DirectDraw';
    upnp: 'UPnP (przekierowanie portu)'; bramki: 'Bramki Battle.net'; wmode: 'StarCraft w trybie okienkowym'; start: 'Start';
    powiadomienie: 'Powiadomienie dźwiękowe'; jezyk: 'Język'; pokazLog: 'Pokaż log'; sprawdzTrase: 'Sprawdź trasę do:';
    pokazKraj: 'Pokaż kraj'; hosty: 'Pokaż nazwy hostów'; pokazKlucz: 'Pokaż CD Key'; startCam: 'Start:'; stopCam: 'Stop:'; lobby: 'Lobby:';
    lobbyPrzed: 'Lobby przed grą:'; wGrze: 'W grze:'; odtwarzajDz: 'Odtwarzaj dźwięk:'; kanal: 'Kanał:'; polacz: 'Połącz';
    polaczony: 'Połączony'; rozlacz: 'Rozłącz'; konfiguruj: 'Konfiguruj'; liczbaWidzow: 'Liczba widzów:'; pokazCzas: 'Pokaż czas';
    pokazWeWy: 'Pokaż wejścia/ wyjścia'; wyslij: 'Wyślij'; rozne: 'Różne'; nagrywanie: 'Nagrywanie'; dotacje: 'Dotacje';
    oProgramie: 'O programie'; uVideo: 'Urządzenie video:'; uAudio: 'Urządzenie audio:'; kodekVideo: 'Kompresja video:';
    kodekAudio: 'Kompresja audio:'; podglad: 'Podgląd'; nagrywaj: 'Nagrywaj'; tLogin: 'Login:'; tHaslo: 'Hasło:';
    domyslnyKanal: 'Domyślny kanał:'; zapiszCzat: 'Archiwizuj czat'; autoPolaczenie: 'Połącz przy starcie programu'; zapisz: 'Zapisz';
    maxBitrate: 'Maksymalna przepływność bitów:'; rodzajPrzeplywnosci: 'Rodzaj przepływności:'; stala: 'Stała (CBR)';
    zmienna: 'Zmienna (VBR)'; przeplywnosc: 'Przepływność bitów:'; kanaly: 'Kanały:'; czestoliwosc: 'Częstotliwość próbkowania:';
    wartosc: 'Wartość:'; predkosc: 'Prędkość myszki'; overlay: 'Nazwy graczy, nazwę mapy'; czasGry: 'Czas gry'; czas: 'Godzinę';
    trybObs: 'Informacje dla obserwatorów'; czatTwitcha: 'Czat Twitch''a'; apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay';
    ukryjPasek: 'Ukryj pasek postępu dla replay''a'; usunLimit: 'Usuń limit slotów przy hostowaniu repów';
    wyswietlZdjecie: 'Wyświetl zdjęcie'; autor: 'Autor:'; kontakt: 'Kontakt:'; dataBuildu: 'Data build''u:'; wersja: 'Wersja:';
    podziekowania: 'Podziękowania za pomoc przy tworzeniu programu dla:';
    wykorzystano: 'Program wykorzystuje następujące pliki binarne od osób trzecich:'; logowanie: 'Automatyczne logowanie'; dodaj: 'Dodaj';
    usun: 'Usuń'; zapisujCzatBn: 'Zapisuj czat Battle.net'; czcionka: 'Zmień czcionkę (Battle.net)'; czcionkaDomyslna: 'Przywróć czcionkę';
    otworzKatalog: 'Otwórz katalog z nagraniami'; aero: 'Interfejs Windows Aero'; trwaNagrywanie: 'Nagrywanie:';
    wiadomosci: 'Ostatnie wiadomości'; jednAt: 'Jednostka atakująca:'; jednPrzy: 'Jednostka atakowana:'; rasa: 'Rasa:';
    jednostka: 'Jednostka:'; upAtak: 'Upgrade do ataku:'; upArmory: 'Upgrade do pancerza:'; oblicz: 'Oblicz'; obrazenia: 'Obrażenia:';
    kalkulator: 'Kalkulator'; aktywuj: 'Aktywuj'; blokada: 'Zablokuj klawisze Windows';
    wsparciePolski: 'Wsparcie dla języka polskiego w grze'; update: 'Dostępna jest nowa wersja'; update2: 'Otworzyć stronę pobrania pliku?';
    schowek: 'Minimalizacja programu do zasobnika'; dialog_uruchomiona: 'Aplikacja jest już uruchomiona!';
    lossless: '"Bezstratna kompresja obrazu"'; streamin: 'Strumieniuj na Twitch'; opoznienie: 'Opóźnienie:';);

  /// /////////////////////////////   ENGLISH
  angielski: TJezyk = (AV2: 'Time:'; AV3: 'Size:'; AV4: 'Dropped frames:'; AV5: 'Bitrate:'; AV6: 'FPS:'; AV7: 'Upload:';
    glosnosc: 'Volume control (CTRL + UP/DOWN)'; f1: 'Disable F1'; pause: 'PAUSE for pause/resume game'; altshift: 'Disable ALT + SHIFT';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Windows Firewall exception'; znaki: 'Change the character set';
    skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Check latency'; daneKonta: 'Account settings:';
    ustawieniaCzatu: 'Chat settings:'; ustawieniaStrumnieniowania: 'Streaming settings:'; ustawieniaKonta: 'Channel settings:';
    ustawGre: 'Set game: "StarCraft: Brood War"'; ustawOpis: 'Set description:'; listaWidzow: 'Viewers'; Pogrubienie: 'Bold';
    bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Check for updates'; nagrywajLokalnie: 'Local recording'; caps: 'Disable CAPS LOCK';
    jump: 'Winamp jump to file'; wyswietl: 'Display in game:'; funkcje: 'Functions:'; kbHook: 'Keyboard hook';
    listStrumieni: 'Update list of streams'; guiUniemozliwi: 'GUIfixes prevents you from joining official Battle.net servers';
    listaGraczy: 'Players'; jKoreanski: 'Support for Korean in game'; track: 'Song information';
    au1: 'OAuth should be generated here:'; au2: 'This should look like this: '; au3: 'next copy paste all text.'; sekundy: 'seconds';
    dyskTwardy: 'Save to disk'; wysylanieWToku: 'Streaming on Twitch...'; zakonczoneNiepo: 'Streaming on Twitch failed';
    wybierzAkcje: 'Choose action for user '; uprawienia: 'Promote to moderator'; tymczasowyBan: 'Ban temporarily';
    zbanuj: 'Ban permanently'; cofUpr: 'Demote moderator'; listaOP: 'Moderators'; odbanuj: 'Unban';
    pobierzKlucz: 'Download stream key and save settings'; priorytet: 'Higher priority for StarCraft';
    trwaPobieranieKlucza: 'Downloading stream key...'; opuscil: 'Parts:'; dolaczyl: 'Joins:'; polaczono: 'Connected with';
    rozlaczono: 'Disconnected from'; fishiInne: 'Fish and others'; naprawKolory: 'Color fix'; emulacjaDD: 'DirectDraw emulation';
    upnp: 'UPnP'; bramki: 'Battle.net Gateways'; wmode: 'Window Mode'; start: 'Start';
    powiadomienie: 'Notification sounds'; jezyk: 'Language:'; pokazLog: 'Show log'; sprawdzTrase: 'Traceroute:'; pokazKraj: 'Show country';
    hosty: 'Resolve host name'; pokazKlucz: 'Show CD Key'; startCam: 'Start:'; stopCam: 'Stop:'; lobby: 'Lobby:'; lobbyPrzed: 'Game lobby:';
    wGrze: 'In game:'; odtwarzajDz: 'Play sound:'; kanal: 'Channel:'; polacz: 'Connect'; polaczony: 'Connected'; rozlacz: 'Disconnect';
    konfiguruj: 'Configure'; liczbaWidzow: 'Viewers:'; pokazCzas: 'Show time'; pokazWeWy: 'Show joins/parts'; wyslij: 'Send';
    rozne: 'Misc.'; nagrywanie: 'Record'; dotacje: 'Donate'; oProgramie: 'About'; uVideo: 'Video device:'; uAudio: 'Audio device:';
    kodekVideo: 'Video compression:'; kodekAudio: 'Audio compression:'; podglad: 'Preview'; nagrywaj: 'Record'; tLogin: 'Login:';
    tHaslo: 'Password:'; domyslnyKanal: 'Default channel:'; zapiszCzat: 'Save chat'; autoPolaczenie: 'Automatically connect at startup';
    zapisz: 'Save'; maxBitrate: 'Maximum bitrate:'; rodzajPrzeplywnosci: 'Encoding method:'; stala: 'Constant (CBR)';
    zmienna: 'Variable (VBR)'; przeplywnosc: 'Bitrate:'; kanaly: 'Channels:'; czestoliwosc: 'Sample rate:'; wartosc: 'Value:';
    predkosc: 'Mouse speed'; overlay: 'Overlay'; czasGry: 'Game time'; czas: 'Time'; trybObs: 'Obs mode'; czatTwitcha: 'Twitch chat';
    apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay'; ukryjPasek: 'Hide replay progress bar';
    usunLimit: 'Remove replay slot limit'; wyswietlZdjecie: 'Display picture'; autor: 'Author:'; kontakt: 'Contact:';
    dataBuildu: 'Build time:'; wersja: 'Version:'; podziekowania: 'Special thanks for helping create this program to:';
    wykorzystano: 'This program uses the following third-party files:'; logowanie: 'Automatically login'; dodaj: 'Add';
    usun: 'Delete'; zapisujCzatBn: 'Save Battle.net chat'; czcionka: 'Change font (Battle.net)'; czcionkaDomyslna: 'Restore font';
    otworzKatalog: 'Open directory with recordings'; aero: 'Windows Aero'; trwaNagrywanie: 'Recording:'; wiadomosci: 'Messages';
    jednAt: 'Unit dealing damage:'; jednPrzy: 'Unit taking damage:'; rasa: 'Race:'; jednostka: 'Unit:'; upAtak: 'Attack upgrade:';
    upArmory: 'Armor upgrade:'; oblicz: 'Calculate'; obrazenia: 'Damage:'; kalkulator: 'Calculator'; aktywuj: 'Activate';
    blokada: 'Disable Windows keys'; wsparciePolski: 'Support for Polish language in game'; update: 'New version is available';
    update2: 'Do you want to open download page?'; schowek: 'Minimize to tray'; dialog_uruchomiona: 'Application is already running!';
    lossless: '"Lossless video compression"'; streamin: 'Stream on Twitch'; opoznienie: 'Delay:';);

  /// /////////////////////////////   UKRAINIAN
  ukrainski: TJezyk = ( // theleo_ua
    AV2: 'Тривалість:'; AV3: 'Розмір:'; AV4: 'Пропущено кадрів:'; AV5: 'Бітрейт:'; AV6: 'Кадрів у секунду:'; AV7: 'Завантажити:';
    glosnosc: 'Гучність (CTRL + UP/DOWN)'; f1: 'Блокувати клавішу F1'; pause: 'Кл. PAUSE припиняє/відновлює гру';
    altshift: 'Блокувати клавіши ALT + SHIFT'; zagubione: 'Полагодити "ігнорування" клавиатури';
    zapora: 'Додати викл. у Брандмауер Windows'; znaki: 'Змінити кодування символів'; skrin: 'Скриншот (CTRL + ALT + P)';
    sprawdzLatency: 'Перевірити зв''язок з сервером'; daneKonta: 'Налаштування аккаунта:'; ustawieniaCzatu: 'Налаштування чата:';
    ustawieniaStrumnieniowania: 'Налаштування стримінга:'; ustawieniaKonta: 'Налаштування канала:';
    ustawGre: 'Вибрати гру: "StarCraft: Brood War"'; ustawOpis: 'Додати описування:'; listaWidzow: 'Список глядячів';
    Pogrubienie: 'Товстий'; bnCzat: 'Чат Battle.net'; sprawdzanieAktualizacji: 'Перевірити оновлення';
    nagrywajLokalnie: 'Зберігати локально'; caps: 'Відключити CAPS LOCK'; jump: 'Winamp jump to file'; wyswietl: 'Показувати у грі:';
    funkcje: 'Функції:'; kbHook: 'Доступ до клавіатури'; listStrumieni: 'Список стримів';
    guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers'; listaGraczy: 'Список гравців';
    jKoreanski: 'Підтримка корейської мови у грі'; track: 'Інфо о пісні'; au1: 'Тут мусить бути сґенерований OAuth:';
    // au2 : 'Це мусить мати приблизно такий вигляд: ';
    au2: 'This should looks like this: '; au3: 'Тепер скопіюй весь текст.'; sekundy: 'секунди'; dyskTwardy: 'Зберегти на диск';
    wysylanieWToku: 'Йде стрим на Twitch...'; zakonczoneNiepo: 'Стрим на Twitch остановлений з помилкою';
    wybierzAkcje: 'Оберіть дію для користувача '; uprawienia: 'Підвищити до модератора'; tymczasowyBan: 'Тимчасово забанити';
    zbanuj: 'Забанити назавжди'; cofUpr: 'Зняти привілеї модератора'; listaOP: 'Показати список усіх модераторів'; odbanuj: 'Розбанити';
    pobierzKlucz: 'Скачати ключ stream та зберегти налаштування'; priorytet: 'Вст. високий пріоритет для StarCraft';
    trwaPobieranieKlucza: 'Скачую ключ stream...'; opuscil: 'Частини:'; dolaczyl: 'Приєднання:'; polaczono: 'З''єднаний з';
    rozlaczono: 'Від''єднаний від'; fishiInne: 'Fish та інші'; naprawKolory: 'Випр. кольорів'; emulacjaDD: 'Эмуляція DirectDraw';
    upnp: 'Використовувати UPnP'; bramki: 'Додати сервери'; wmode: 'Запуск StarCraft у віконному режимі'; start: 'Запуск';
    powiadomienie: 'Звукове повідомлення'; jezyk: 'Мова:'; pokazLog: 'Показати лог'; sprawdzTrase: 'Трасування маршруту:';
    pokazKraj: 'Показати країну'; hosty: 'Визначити IP-адресу хоста'; pokazKlucz: 'Відображати ключ гри'; startCam: 'Старт:';
    stopCam: 'Стоп:'; lobby: 'Лоббі:'; lobbyPrzed: 'Лоббі початку гри:'; wGrze: 'У грі:'; odtwarzajDz: 'Програти звук:'; kanal: 'Канал:';
    polacz: 'Підключитися'; polaczony: 'Підключений'; rozlacz: 'Відключитися'; konfiguruj: 'Налаштувати';
    liczbaWidzow: 'Кількість глядачів:'; pokazCzas: 'Час'; pokazWeWy: 'Показати підключення / відключення'; wyslij: 'Відправити';
    rozne: 'Різне'; nagrywanie: 'Запис'; dotacje: 'Пожертвувати'; oProgramie: 'Про програму'; uVideo: 'Відео пристрій:';
    uAudio: 'Аудіо пристрій:'; kodekVideo: 'Відео компресія:'; kodekAudio: 'Аудіо компресія:'; podglad: 'П. перегляд'; nagrywaj: 'Запис';
    tLogin: 'Ім`я користувача:'; tHaslo: 'Пароль:'; domyslnyKanal: 'Канал за замовч.:'; zapiszCzat: 'Зберегти чат';
    autoPolaczenie: 'Автопідключення при запуску'; zapisz: 'Зберегти'; maxBitrate: 'Максимальний бітрейт:';
    rodzajPrzeplywnosci: 'Метод кодування:'; stala: 'Сталий (CBR)'; zmienna: 'Змінний (VBR)'; przeplywnosc: 'Бітрейт:'; kanaly: 'Канали:';
    czestoliwosc: 'Частота дискретизації:'; wartosc: 'Значення:'; predkosc: 'Змінити чутливість миші'; overlay: 'Відображати оверлей';
    czasGry: 'Тривалість гри'; czas: 'Час'; trybObs: 'Режим глядача'; czatTwitcha: 'Чат Twitch’a'; apm: 'APM'; winamp: 'Winamp / AIMP';
    autoreplay: 'Зберігати реплеї автоматично'; ukryjPasek: 'Приховати повзунок у реплеї'; usunLimit: 'Усунути обмеження слотів у реплеї';
    wyswietlZdjecie: 'Display picture'; autor: 'Автор:'; kontakt: 'Контакти:'; dataBuildu: 'Час складання:'; wersja: 'Версія:';
    podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Підключатися автоматично';
    dodaj: 'Додати'; usun: 'Видалити'; zapisujCzatBn: 'Зберегти чат Battle.net'; czcionka: 'Змінити шрифт (Battle.net)';
    czcionkaDomyslna: 'Відновити шрифт'; otworzKatalog: 'Відкрити папку с відеозаписами'; aero: 'Windows Aero';
    trwaNagrywanie: 'Йде запис:'; wiadomosci: 'Повідомлення'; jednAt: 'Юніт завдає шкоду:'; jednPrzy: 'Юніт одержує шкоду:'; rasa: 'Раса:';
    jednostka: 'Юніт:'; upAtak: 'Апгрейд атаки:'; upArmory: 'Апгрейд броні:'; oblicz: 'Порахувати'; obrazenia: 'Шкода:';
    kalkulator: 'Калькулятор'; aktywuj: 'Активувати'; blokada: 'Відключити клавішу "Windows"';
    wsparciePolski: 'Підтримка польскої мови у грі'; update: 'Вийшла нова версія'; update2: 'Відкрити сторінку завантаження?';
    schowek: 'Мінімізувати у трей'; dialog_uruchomiona: 'Application is already running!'; lossless: '"Стиснення відео без утрат"';
    streamin: 'Стримити на Twitch'; opoznienie: 'Затримка:';);

  /// /////////////////////////////   RUSSIAN
  rosyjski: TJezyk = ( // defiler.ru o4ko,DreamJunkie,Tassadar,Neo,Burjuigovno
    AV2: 'Длительность:'; AV3: 'Размер:'; AV4: 'Пропущено кадров:'; AV5: 'Битрейт:'; AV6: 'Кадров в секунду:'; AV7: 'Загрузить:';
    glosnosc: 'Громкость (CTRL + UP/DOWN)'; f1: 'Блокировать клавишу F1'; pause: 'Кл. PAUSE приост./возобн. игру';
    altshift: 'Блокировать клавиши ALT + SHIFT'; zagubione: 'Исправить "игнор." клавиатуры'; zapora: 'Добавить искл. в Брандмауэр Windows';
    znaki: 'Изменить кодировку символов'; skrin: 'Скриншот (CTRL + ALT + P)'; sprawdzLatency: 'Проверить связь с сервером';
    daneKonta: 'Настройки аккаунта:'; ustawieniaCzatu: 'Настройки чата:'; ustawieniaStrumnieniowania: 'Настройки стриминга:';
    ustawieniaKonta: 'Настройки канала:'; ustawGre: 'Выбрать игру: "StarCraft: Brood War"'; ustawOpis: 'Добавить описание:';
    listaWidzow: 'Список зрителей'; Pogrubienie: 'Жирный'; bnCzat: 'Чат Battle.net'; sprawdzanieAktualizacji: 'Проверить обновления';
    nagrywajLokalnie: 'Сохранить локально'; caps: 'Отключить CAPS LOCK'; jump: 'Winamp jump to file'; wyswietl: 'Показывать в игре:';
    funkcje: 'Функции:'; kbHook: 'Доступ к клавиатуре'; listStrumieni: 'Список стримов';
    guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers'; listaGraczy: 'Список игроков';
    jKoreanski: 'Поддержка корейского языка в игре'; track: 'Инфо о песне'; au1: 'Здесь должен быть сгенерирован OAuth:';
    // au2 : 'Это должно выглядеть примерно так: ';
    au2: 'This should looks like this: '; au3: 'next copy paste all text.'; sekundy: 'секунды'; dyskTwardy: 'Сохранить на диск';
    wysylanieWToku: 'Идет стрим на Twitch...'; zakonczoneNiepo: 'Стрим на Twitch остановлен с ошибкой';
    wybierzAkcje: 'Выберите действие для пользователя '; uprawienia: 'Повысить до модератора'; tymczasowyBan: 'Временно забанить';
    zbanuj: 'Забанить навсегда'; cofUpr: 'Снять привилегии модератора'; listaOP: 'Показать список всех модераторов'; odbanuj: 'Разбанить';
    pobierzKlucz: 'Скачать ключ stream и сохранить настройки'; priorytet: 'Уст. высокий приоритет для StarCraft';
    trwaPobieranieKlucza: 'Скачиваю ключ stream...'; opuscil: 'Oтсоединение:'; dolaczyl: 'Присоединения:'; polaczono: 'Соединен с';
    rozlaczono: 'Отсоединен от'; fishiInne: 'Fish и другие'; naprawKolory: 'Исправление цветов'; emulacjaDD: 'Эмуляция DirectDraw';
    upnp: 'Использовать UPnP'; bramki: 'Добавить сервера'; wmode: 'Запуск StarCraft в оконном режиме'; start: 'Запуск';
    powiadomienie: 'Звуковое оповещение'; jezyk: 'Язык:'; pokazLog: 'Показать лог'; sprawdzTrase: 'Трассировка маршрута:';
    // 'Произвести трассировку маршрута';
    pokazKraj: 'Показать страну'; hosty: 'Определить IP-адрес хоста'; pokazKlucz: 'Отобразить ключ игры'; startCam: 'Старт:';
    stopCam: 'Стоп:'; lobby: 'Лобби:'; lobbyPrzed: 'Лобби начала игры:'; wGrze: 'В игре:'; odtwarzajDz: 'Проиграть звук:'; kanal: 'Канал:';
    polacz: 'Подключиться'; polaczony: 'Подключен'; rozlacz: 'Отключиться'; konfiguruj: 'Настроить'; liczbaWidzow: 'Количество зрителей:';
    pokazCzas: 'Время'; pokazWeWy: 'Показать подключения / отключения'; wyslij: 'Отправить'; rozne: 'Разное'; nagrywanie: 'Запись';
    dotacje: 'Пожертвовать'; oProgramie: 'Информ.'; // 'О программе';
    uVideo: 'Видео устройство:'; uAudio: 'Аудио устройство:'; kodekVideo: 'Видео компрессия:'; kodekAudio: 'Аудио компрессия:';
    podglad: 'Предпросмотр'; nagrywaj: 'Запись'; tLogin: 'Имя пользователя:'; tHaslo: 'Пароль:'; domyslnyKanal: 'Канал по умолч.:';
    zapiszCzat: 'Сохранить чат'; autoPolaczenie: 'Автоподключение при запуске'; zapisz: 'Сохранить'; maxBitrate: 'Максимальный битрейт:';
    rodzajPrzeplywnosci: 'Метод кодирования:'; stala: 'Постоянный (CBR)'; zmienna: 'Переменный (VBR)'; przeplywnosc: 'Битрейт:';
    kanaly: 'Каналы:'; czestoliwosc: 'Частота дискретизации:'; wartosc: 'Значение:'; predkosc: 'Изменить чувствительность мыши';
    overlay: 'Отображать оверлей'; czasGry: 'Длительность игры'; czas: 'Время'; trybObs: 'Зрительский режим'; czatTwitcha: 'Чат Twitch’a';
    apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Сохранять реплеи автоматически'; ukryjPasek: 'Спрятать ползунок в реплее';
    usunLimit: 'Убрать ограничение слотов в реплее'; wyswietlZdjecie: 'Display picture'; autor: 'Автор:'; kontakt: 'Контакты:';
    dataBuildu: 'Время сборки:'; wersja: 'Версия:'; podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Подключаться автоматически';
    dodaj: 'Добавить'; usun: 'Удалить'; zapisujCzatBn: 'Сохранить чат'; czcionka: 'Сменить шрифт (Battle.net)';
    czcionkaDomyslna: 'Восстановить шрифт'; otworzKatalog: 'Открыть папку с видеозаписями'; aero: 'Windows Aero';
    trwaNagrywanie: 'Идет запись:'; wiadomosci: 'Сообщения'; jednAt: 'Юнит наносит урон:'; jednPrzy: 'Юнит получает урон:'; rasa: 'Раса:';
    jednostka: 'Юнит:'; upAtak: 'Апгрейд атаки:'; upArmory: 'Апгрейд брони:'; oblicz: 'Посчитать'; obrazenia: 'Урон:';
    kalkulator: 'Калькулятор'; aktywuj: 'Активировать'; blokada: 'Отключить клавишу "Windows"';
    wsparciePolski: 'Поддержка польского языка в игре'; update: 'Вышла новая версия'; update2: 'Открыть страницу загрузки?';
    schowek: 'Минимизировать в трей'; dialog_uruchomiona: 'Application is already running!'; lossless: '"Сжатие видео без потерь"';
    streamin: 'Стримить на Twitch'; opoznienie: 'Задержка:';);

  /// /////////////////////////////   SPANISH
  hiszpanski: TJezyk = ( // Arca(Crema)
    AV2: 'Time:'; AV3: 'Size:'; AV4: 'Dropped frames:'; AV5: 'Bitrate:'; AV6: 'Frames per second:'; AV7: 'Upload:';
    glosnosc: 'Volume control (CTRL + UP/DOWN)'; f1: 'Disable F1'; pause: 'PAUSE for pause/resume game'; altshift: 'Disable ALT + SHIFT';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Add exception to Windows firewall'; znaki: 'Change the character set';
    skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Check latency'; daneKonta: 'Account settings:';
    ustawieniaCzatu: 'Chat settings:'; ustawieniaStrumnieniowania: 'Streaming settings:'; ustawieniaKonta: 'Channel settings:';
    ustawGre: 'Set game: "StarCraft: Brood War"'; ustawOpis: 'Set description:'; listaWidzow: 'List of viewers'; Pogrubienie: 'Bold';
    bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Check for updates'; nagrywajLokalnie: 'Local recording';
    caps: 'Inutulizar Bloque de Mayúsculas'; jump: 'Winamp mostrar archivo'; wyswietl: 'Mostrar dentro de la partida:';
    funkcje: 'Funciones:'; kbHook: 'Keyboard hook'; listStrumieni: 'Lista de streams';
    guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers'; listaGraczy: 'Lista de jugadores';
    jKoreanski: 'Soporte de corean dentro de la partida'; track: 'Información de la canción'; au1: 'OAuth deberia generarse aquí:';
    au2: 'Esto debería ser así: '; au3: 'Ahora copia y pega todo el texto.'; sekundy: 'segundos'; dyskTwardy: 'Guardar en disco';
    wysylanieWToku: 'Streaming en Twitch...'; zakonczoneNiepo: 'Streaming en Twitch se detuvo por un fallo    ';
    wybierzAkcje: 'Elija acción para el usuario '; uprawienia: 'Ascender a moderador'; tymczasowyBan: 'Ben temporal';
    zbanuj: 'Ban permanente'; cofUpr: 'Remover moderator'; listaOP: 'Muestra una lista de todos los moderadores'; odbanuj: 'Deshacer ban';
    pobierzKlucz: 'Descargar clave del stream y guardar la configuración'; priorytet: 'Darle una prioridad mayor al StarCraft';
    trwaPobieranieKlucza: 'Descargando clave del stream...'; opuscil: 'Se va:'; dolaczyl: 'Se une'; polaczono: 'Conectado con';
    rozlaczono: 'Desconectado de'; fishiInne: 'Fish y otros'; naprawKolory: 'Arreglo de colores'; emulacjaDD: 'Emulación DirectDraw';
    upnp: 'Habilitar UPnP'; bramki: 'Agregar servidores'; wmode: 'Ejecutar StarCraft en window-mode'; start: 'Ejecutar';
    powiadomienie: 'Notificación sonora'; jezyk: 'Lenguaje:'; pokazLog: 'Mostrar log'; sprawdzTrase: 'Rastrear ruta:';
    pokazKraj: 'Mostrar país'; hosty: 'Resolver el nombre del host'; pokazKlucz: 'Mostrar CD Key'; startCam: 'Iniciar:'; stopCam: 'Parar:';
    lobby: 'Lobby:'; lobbyPrzed: 'Lobby antes del juego:'; wGrze: 'Dentro de la partida:'; odtwarzajDz: 'Reproducir sonido:';
    kanal: 'Canal:'; polacz: 'Conectar'; polaczony: 'Conectado'; rozlacz: 'Desconectar'; konfiguruj: 'Configurar';
    liczbaWidzow: 'Número de espectadores:'; pokazCzas: 'Hora'; pokazWeWy: 'Mostrar se une/se va'; wyslij: 'Enviar'; rozne: 'Miscelánea';
    nagrywanie: 'Grabación'; dotacje: 'Donar'; oProgramie: 'Sobre'; uVideo: 'Dispositivo de video:'; uAudio: 'Dispositivo de audio:';
    kodekVideo: 'Compresión de video:'; kodekAudio: 'Compresión de audio:'; podglad: 'Vista previa'; nagrywaj: 'Record'; tLogin: 'Login:';
    tHaslo: 'Contraseña:'; domyslnyKanal: 'Canal por defecto:'; zapiszCzat: 'Guardar chat';
    autoPolaczenie: 'Conectar automaticamente al empezar'; zapisz: 'Guardar'; maxBitrate: 'Tasa de Bits máxima:';
    rodzajPrzeplywnosci: 'Método de codificación:'; stala: 'Constante (CBR)'; zmienna: 'Variable (VBR)'; przeplywnosc: 'Tasa de Bits:';
    kanaly: 'Canales:'; czestoliwosc: 'Tasa de muestreo:'; wartosc: 'Valor:'; predkosc: 'Cambiar la velocidad del ratón';
    overlay: 'Mostrar  el superposición'; czasGry: 'Tiempo del juego'; czas: 'Hora'; trybObs: 'Modo observador'; czatTwitcha: 'Twitch chat';
    apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Auto-replay'; ukryjPasek: 'Esconder la barra de progreso del replay';
    usunLimit: 'Remover límite de slots para replays'; wyswietlZdjecie: 'Display picture'; autor: 'Autor:'; kontakt: 'Contacto:';
    dataBuildu: 'Tiempo:'; // de Construcción:';
    wersja: 'Versión:'; podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Conectar automaticamente';
    dodaj: 'Agragar'; usun: 'Eliminar'; zapisujCzatBn: 'Guardar chat de Battle.net'; czcionka: 'Cambiar fuente (Battle.net)';
    czcionkaDomyslna: 'Restore font'; otworzKatalog: 'Abrir el directorio de las grabaciones'; aero: 'Windows Aero';
    trwaNagrywanie: 'Recording:'; wiadomosci: 'Messages'; jednAt: 'Unidad haceindo daño:'; jednPrzy: 'Unidad recibiendo daño:';
    rasa: 'Raza:'; jednostka: 'Unidad:'; upAtak: 'Mejora de ataque:'; upArmory: 'Mejora de armadura:'; oblicz: 'Calcular';
    obrazenia: 'Daño:'; kalkulator: 'Calculadora'; aktywuj: 'Activar'; blokada: 'Deshabilitar llaves de Windows';
    wsparciePolski: 'Soporte de polaco dentro de la partida'; update: 'Una nueva versión está disponible';
    update2: 'Quieres abrir la página de descarga?'; schowek: 'Minimizar a la bandeja';
    dialog_uruchomiona: 'La aplicación ya está funcionando!'; lossless: '"Compression de video Lossless"'; streamin: 'Stream e Twitch';
    opoznienie: 'Retraso:';);

  /// /////////////////////////////   GERMAN
  niemiecki: TJezyk = ( // freak,cryoc, enjoyme, iCCup.dAmn
    AV2: 'Zeit:'; AV3: 'Größe:'; AV4: 'Bildverluste:'; AV5: 'Bitrate:'; AV6: 'Bilder pro Sekunde:'; AV7: 'Upload:';
    glosnosc: 'Lautstärke (CTRL + UP/DOWN)'; f1: 'Deaktiviere F1'; pause: 'PAUSE um pause/starten des Spiels';
    altshift: 'Deaktiviere ALT + SHIFT'; zagubione: 'Fix "lost" Tastatureingabe'; zapora: 'Ausnahme für die Windows Firewall einfügen';
    znaki: 'Zeichensatz wechseln'; skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Verzögerung checken';
    daneKonta: 'Account Einstellungen:'; ustawieniaCzatu: 'Chat Einstellungen:'; ustawieniaStrumnieniowania: 'Streaming Einstellungen:';
    ustawieniaKonta: 'Channel Einstellungen:'; ustawGre: 'Spiel auf: "StarCraft: Brood War" setzen"'; ustawOpis: 'Beschreibung setzen:';
    listaWidzow: 'Liste der Zuschauer'; Pogrubienie: 'Fett'; bnCzat: 'Battle.net Chat'; sprawdzanieAktualizacji: 'Updates prüfen';
    nagrywajLokalnie: 'Lokale-Aufnahme'; caps: 'CAPS LOCK deaktivieren'; jump: 'Springe zu Winamp Datei'; wyswietl: 'Anzeige im Spiel:';
    funkcje: 'Funktionen:'; kbHook: 'Tastatur Haken'; listStrumieni: 'Liste der Streams';
    guiUniemozliwi: 'GUIfixes verhindert, dass du einem offiziellen Blizzard Server beitreten kannst'; listaGraczy: 'Liste der Spieler';
    jKoreanski: 'Unterstützung der koreanischen Sprache'; track: 'Song information'; au1: 'OAuth sollte hier generiert werden:';
    au2: 'Das sollte so aussehen: '; au3: 'jetzt kopiere/einfüge den Text.'; sekundy: 'Sekunden'; dyskTwardy: 'Speichern auf Festplatte';
    wysylanieWToku: 'Streamen auf Twitch...'; zakonczoneNiepo: 'Streamen auf Twitch angehalten wegen eines Fehlers';
    wybierzAkcje: 'Wähle eine aktion für den Benutzer'; uprawienia: 'Moderator ernennen'; tymczasowyBan: 'zeitweise ban';
    zbanuj: 'dauer ban'; cofUpr: 'Moderator zurücksetzen'; listaOP: 'Zeige eine Liste aller Moderatoren'; odbanuj: 'ban rückgängig';
    pobierzKlucz: 'Lade Stream Key und speicher Einstellungen'; priorytet: 'Setze StarCraft auf höhere Priortät';
    trwaPobieranieKlucza: 'Lade Stream Key...'; opuscil: 'Teile:'; dolaczyl: 'Joins:'; polaczono: 'Verbinden mit';
    rozlaczono: 'Trennen von'; fishiInne: 'Fish und andere'; naprawKolory: 'Farben korrigieren'; emulacjaDD: 'DirectDraw-Emulation';
    upnp: 'UPnP einschalten'; bramki: 'Gateways hinzufügen'; wmode: 'StarCraft im Fenstermodus starten'; start: 'Start';
    powiadomienie: 'Spiele Benachrichtigungston'; jezyk: 'Sprachen:'; pokazLog: 'Logs anzeigen';
    sprawdzTrase: 'Server-Verbindung nachverfolgen:'; pokazKraj: 'Land anzeigen'; hosty: 'Host-Namen auflösen';
    pokazKlucz: 'Eigenen CD-Key antzeigen'; startCam: 'Start:'; stopCam: 'Stop:'; lobby: 'Lobby:'; lobbyPrzed: 'Spiel-Lobby:';
    wGrze: 'im Spiel:'; odtwarzajDz: 'Audio spielen:'; kanal: 'Kanal:'; polacz: 'Verbinden'; polaczony: 'Verbunden';
    rozlacz: 'Verbindung trennen'; konfiguruj: 'Konfigurieren'; liczbaWidzow: 'Zuschauerzahl:'; pokazCzas: 'Zeit';
    pokazWeWy: 'Zeigen betreten/ verlassen'; wyslij: 'Nachricht senden'; rozne: 'Verschiedenes'; nagrywanie: 'Aufnahmen'; dotacje: 'Spende';
    oProgramie: 'Über'; uVideo: 'Videogerät:'; uAudio: 'Audiogerät:'; kodekVideo: 'Videokompression:'; kodekAudio: 'Audiokompression:';
    podglad: 'Vorschau'; nagrywaj: 'Aufzeichnung'; tLogin: 'Login:'; tHaslo: 'Passwort:'; domyslnyKanal: 'Standard Kanal:';
    zapiszCzat: 'Speicher Chat'; autoPolaczenie: 'Automatisch verbinden beim Start'; zapisz: 'Speicher'; maxBitrate: 'maximale Bitrate:';
    rodzajPrzeplywnosci: 'Encoding method:'; stala: 'Konstant (CBR)'; zmienna: 'Variable (VBR)'; przeplywnosc: 'Bitrate:';
    kanaly: 'Kanäle:'; czestoliwosc: 'Abtastgeschwingdigkeit:'; wartosc: 'Wert:'; predkosc: 'Setze Mausgeschwindigkeit';
    overlay: 'Overlay im Spiel einblenden'; czasGry: 'Die aktuelle Spielzeit'; czas: 'Die aktuelle Zeit'; trybObs: 'Beobachtermodus';
    czatTwitcha: 'Twitch-Chat'; apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Spiel automatisch speichern';
    ukryjPasek: 'Replay-Fortschritt verbergen'; usunLimit: 'Replay-Slotbeschränkung aufheben'; wyswietlZdjecie: 'Display Bild';
    autor: 'Author:'; kontakt: 'Kontakt:'; dataBuildu: 'Bauzeit:'; wersja: 'Version:';
    podziekowania: 'Danke für die Unterstützung zum erstellen des Programms von:';
    wykorzystano: 'Das Programm nutzt die folgendenbinären Dateien von 3rd PP:'; logowanie: 'Automatischer Login'; dodaj: 'Hinzufügen';
    usun: 'Löschen'; zapisujCzatBn: 'Speicher Battle.net Chat'; czcionka: 'Wechsle Schriftart (Battle.net)';
    czcionkaDomyslna: 'Schrift wiederherstellen'; otworzKatalog: 'Öffne Aufnahme Ordner'; aero: 'Windows Aero'; trwaNagrywanie: 'Aufnahme:';
    wiadomosci: 'Nachrichten'; jednAt: 'Unit dealing damage:'; jednPrzy: 'Unit taking damage:'; rasa: 'Rasse:'; jednostka: 'Unit:';
    upAtak: 'Attack upgrade:'; upArmory: 'Armor upgrade:'; oblicz: 'Calculate'; obrazenia: 'Schaden:'; kalkulator: 'Rechner';
    aktywuj: 'aktivieren'; blokada: 'Deaktiviere Win Key'; wsparciePolski: 'Unterstützung der polnischen Sprache';
    update: 'Es gibt eine neuere Version'; update2: 'Willst du die Downloadseite öffnen?'; schowek: 'Minimieren zum tray';
    dialog_uruchomiona: 'Anwendung läuft bereits!'; lossless: '"Verlustfreie Video Kompression"'; streamin: 'Streamen auf Twitch';
    opoznienie: 'Verzögerung:';);

 /// ///////////////////////////// FRENCH
  francuski: TJezyk = (AV2: 'Temps:'; AV3: 'Taille:'; AV4: 'Images perdues:'; AV5: 'Bitrate:'; AV6: 'FPS:'; AV7: 'Upload:';
    glosnosc: 'Contrôle du Volume (CTRL + HAUT/BAS)'; f1: 'F1 Hors Fonction'; pause: 'PAUSE pour suspendre/reprendre la partie'; altshift: 'ALT + SHIFT Hors fonction';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Exception du pare-feu Windows'; znaki: 'Change the character set';
    skrin: 'Capture d'écran (CTRL + ALT + P)'; sprawdzLatency: 'Controle de la latence'; daneKonta: 'Paramètre du compte:';
    ustawieniaCzatu: 'Paramètre du Chat:'; ustawieniaStrumnieniowania: 'Paramètre de diffusion:'; ustawieniaKonta: 'Paramètre du canal:';
    ustawGre: 'Selectionner le jeu: "StarCraft: Brood War"'; ustawOpis: 'Selectionner la description:'; listaWidzow: 'Spectateurs'; Pogrubienie: 'Gras';
    bnCzat: 'Discussion Battle.net'; sprawdzanieAktualizacji: 'Vérification des mises à jour'; nagrywajLokalnie: 'Enregistrement local'; caps: 'CAPS LOCK hors fonction';
    jump: 'Winamp: Aller au fichier'; wyswietl: 'Affichage en jeu:'; funkcje: 'Fonctions:'; kbHook: 'Keyboard hook';
    listStrumieni: 'Mettre à jour la liste des diffusions'; guiUniemozliwi: 'GUIfixes vous empêche de rejoindre les serveurs officiel Battle.net';
    listaGraczy: 'Joueurs'; jKoreanski: 'Assistance pour le koréen en partie; track: 'Information de la chanson';
    au1: 'OAuth devrais être générer ici:'; au2: 'Ceci devrait ressembgler à cela: '; au3: 'next copy paste all text.'; sekundy: 'secondes';
    dyskTwardy: 'Enregistrer sur le disque dur'; wysylanieWToku: 'Diffuser sur Twitch...'; zakonczoneNiepo: 'La diffusion sur Twitch a échouée;
    wybierzAkcje: 'Choisir une fonction pour l'utilisation'; uprawienia: 'Promouvoir comme modérateur'; tymczasowyBan: 'Bannir temporairement';
    zbanuj: 'Ban permanent'; cofUpr: 'Destituer de modérateur'; listaOP: 'Modérateurs'; odbanuj: 'Enlever le ban';
    pobierzKlucz: 'Télécharger la clé de stream et sauvegarder les paramètres'; priorytet: 'StarCraft en prioritée haute';
    trwaPobieranieKlucza: 'Téléchargement de la clé de stream...'; opuscil: 'Parties:'; dolaczyl: 'Rejoindre:'; polaczono: 'Connecter avec';
    rozlaczono: 'Déconnecter de'; fishiInne: 'Fish et autres'; naprawKolory: 'Fixation des couleurs'; emulacjaDD: 'Emulation DirectDraw';
    upnp: 'UPnP'; bramki: 'Portails Battle.net'; wmode: 'Mode fenétrer'; start: 'Démarrer';
    powiadomienie: 'Notifications sonore'; jezyk: 'Langue:'; pokazLog: 'Afficher le journal'; sprawdzTrase: 'Traceroute:'; pokazKraj: 'Afficher le pays';
    hosty: 'Résoudre le nom de l'hôte'; pokazKlucz: 'Montrer la clé CD'; startCam: 'Démarrer:'; stopCam: 'Arrêter:'; lobby: 'Lobby:'; lobbyPrzed: 'Lobby en jeu:';
    wGrze: 'En partie:'; odtwarzajDz: 'Jouer le son:'; kanal: 'Canal:'; polacz: 'Connection'; polaczony: 'Connecter'; rozlacz: 'Déconnecter';
    konfiguruj: 'Configurer'; liczbaWidzow: 'Spectateurs:'; pokazCzas: 'Afficher l'heure'; pokazWeWy: 'Afficher spectateurs joignent/quitte le stream'; wyslij: 'Envoyer';
    rozne: 'Divers'; nagrywanie: 'Enregistrement'; dotacje: 'Donation'; oProgramie: 'A propos'; uVideo: 'Dispositif vidéo:'; uAudio: 'Dispositif audio:';
    kodekVideo: 'Compréssion de la vidéo:'; kodekAudio: 'Compréssion de l'audio:'; podglad: 'Prévisualisation'; nagrywaj: 'Enregistrement'; tLogin: 'Identifiant:';
    tHaslo: 'Mot de passe:'; domyslnyKanal: 'Canal par défault:'; zapiszCzat: 'Enregistrer la discution'; autoPolaczenie: 'Connection automatique au démarrage';
    zapisz: 'Enregistrer'; maxBitrate: 'Bitrate maximum:'; rodzajPrzeplywnosci: 'Méthode d'encodage:'; stala: 'Constant (CBR)';
    zmienna: 'Variable (VBR)'; przeplywnosc: 'Bitrate:'; kanaly: 'Canaux:'; czestoliwosc: 'Sample rate:'; wartosc: 'Valeur:';
    predkosc: 'Vitesse de la souris'; overlay: 'Overlay'; czasGry: 'Temps de jeu'; czas: 'Heure'; trybObs: 'Mode d'observation'; czatTwitcha: 'Chat Twitch';
    apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay'; ukryjPasek: 'Caché la barre de progréssion du replay';
    usunLimit: 'Enlever la limite de slot du replay'; wyswietlZdjecie: 'Afficher l'image'; autor: 'Auteur:'; kontakt: 'Contact:';
    dataBuildu: 'Build time:'; wersja: 'Version:'; podziekowania: 'Special thanks for helping create this program to:';
    wykorzystano: 'Ce programme utilise les fichier-tiers suivants:'; logowanie: 'Connection automatique'; dodaj: 'Ajouter';
    usun: 'Delete'; zapisujCzatBn: 'Save Battle.net chat'; czcionka: 'Change font (Battle.net)'; czcionkaDomyslna: 'Restore font';
    otworzKatalog: 'Ouvrir le fichier de récéption des enregistrements'; aero: 'Windows Aero'; trwaNagrywanie: 'Enregistrement:'; wiadomosci: 'Messages';
    jednAt: 'Dégâts des unitées:'; jednPrzy: 'Unitées recevant des dégâts:'; rasa: 'Race:'; jednostka: 'Unitée:'; upAtak: 'Amélioration d'attaque:';
    upArmory: 'Amélioration d'aarmure'; oblicz: 'Calcule'; obrazenia: 'Dégâts:'; kalkulator: 'Calculateur'; aktywuj: 'Activer';
    blokada: 'Windows keys hors fonction'; wsparciePolski: 'Assistance pour la langue Polonaise en jeu'; update: 'Une nouvelle version est disponible';
    update2: 'Voulez vous ouvrir la page de téléchargement ?'; schowek: 'Minimisez'; dialog_uruchomiona: 'L'application est déjà activé!';
    lossless: '"Compression vidéo sans perte"'; streamin: 'Diffusion sur Twitch'; opoznienie: 'Delai:';);

  /// /////////////////////////////   HUNGARIAN
  wegierski: TJezyk = ( // Breach
    AV2: 'Time:'; AV3: 'Size:'; AV4: 'Dropped frames:'; AV5: 'Bitrate:'; AV6: 'Frames per second:'; AV7: 'Upload:';
    glosnosc: 'Volume control (CTRL + UP/DOWN)'; f1: 'Disable F1'; pause: 'PAUSE for pause/resume game'; altshift: 'Disable ALT + SHIFT';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Add exception to Windows firewall'; znaki: 'Change the character set';
    skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Check latency'; daneKonta: 'Account settings:';
    ustawieniaCzatu: 'Chat settings:'; ustawieniaStrumnieniowania: 'Streaming settings:'; ustawieniaKonta: 'Channel settings:';
    ustawGre: 'Set game: "StarCraft: Brood War"'; ustawOpis: 'Set description:'; listaWidzow: 'List of viewers'; Pogrubienie: 'Bold';
    bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Check for updates'; nagrywajLokalnie: 'Local recording'; caps: 'Disable CAPS LOCK';
    jump: 'Winamp jump to file'; wyswietl: 'Display in game:'; funkcje: 'Functions:'; kbHook: 'Keyboard hook';
    listStrumieni: 'Update list of streams'; guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers';
    listaGraczy: 'List of players'; jKoreanski: 'Support for Korean language in game'; track: 'Song information';
    au1: 'OAuth should be generated here:'; au2: 'This should looks like this: '; au3: 'next copy paste all text.'; sekundy: 'seconds';
    dyskTwardy: 'Save to disk'; wysylanieWToku: 'Streaming on Twitch...'; zakonczoneNiepo: 'Streaming on Twitch failed';
    wybierzAkcje: 'Choose action for user '; uprawienia: 'Promote to moderator'; tymczasowyBan: 'Ban temporarily';
    zbanuj: 'Ban permanently'; cofUpr: 'Demote moderator'; listaOP: 'Show a list of all moderators'; odbanuj: 'Reverse ban';
    pobierzKlucz: 'Download stream key and save settings'; priorytet: 'Higher priority for StarCraft';
    trwaPobieranieKlucza: 'Downloading stream key...'; opuscil: 'Parts:'; dolaczyl: 'Joins:'; polaczono: 'Connected with';
    rozlaczono: 'Disconnected from'; fishiInne: 'Fish and others'; naprawKolory: 'Szinek beállitása'; emulacjaDD: 'DirectDraw emulation';
    upnp: 'UPnP engedélyezése'; bramki: 'Gateway registiry hozzáadása'; wmode: 'StarCraft futattása ablakban'; start: 'Inditása';
    powiadomienie: 'Notification sounds'; jezyk: 'Language:'; pokazLog: 'Show log'; sprawdzTrase: 'Trace route:'; pokazKraj: 'Show country';
    hosty: 'Resolve host name'; pokazKlucz: 'Show CD Key'; startCam: 'Start:'; stopCam: 'Stop:'; lobby: 'Lobby:'; lobbyPrzed: 'Game lobby:';
    wGrze: 'In game:'; odtwarzajDz: 'Play sound:'; kanal: 'Channel:'; polacz: 'Connect'; polaczony: 'Connected'; rozlacz: 'Disconnect';
    konfiguruj: 'Configure'; liczbaWidzow: 'Viewers:'; pokazCzas: 'Show time'; pokazWeWy: 'Show joins/parts'; wyslij: 'Send';
    rozne: 'Misc.'; nagrywanie: 'Record'; dotacje: 'Donate'; oProgramie: 'About'; uVideo: 'Video device:'; uAudio: 'Audio device:';
    kodekVideo: 'Video compression:'; kodekAudio: 'Audio compression:'; podglad: 'Preview'; nagrywaj: 'Record'; tLogin: 'Login:';
    tHaslo: 'Password:'; domyslnyKanal: 'Default channel:'; zapiszCzat: 'Save chat'; autoPolaczenie: 'Automatically connect at startup';
    zapisz: 'Save'; maxBitrate: 'Maximum bitrate:'; rodzajPrzeplywnosci: 'Encoding method:'; stala: 'Constant (CBR)';
    zmienna: 'Variable (VBR)'; przeplywnosc: 'Bitrate:'; kanaly: 'Channels:'; czestoliwosc: 'Sample rate:'; wartosc: 'Value:';
    predkosc: 'Mouse speed'; overlay: 'Overlay'; czasGry: 'Game time'; czas: 'Time'; trybObs: 'Obs mode'; czatTwitcha: 'Twitch chat';
    apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay'; ukryjPasek: 'Hide replay progress bar';
    usunLimit: 'Remove replay slot limit'; wyswietlZdjecie: 'Display picture'; autor: 'Author:'; kontakt: 'Contact:';
    dataBuildu: 'Build time:'; wersja: 'Version:'; podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Automatically logon'; dodaj: 'Add';
    usun: 'Delete'; zapisujCzatBn: 'Save Battle.net chat'; czcionka: 'Change font (Battle.net)'; czcionkaDomyslna: 'Restore font';
    otworzKatalog: 'Open directory with recordings'; aero: 'Windows Aero'; trwaNagrywanie: 'Recording:'; wiadomosci: 'Messages';
    jednAt: 'Unit dealing damage:'; jednPrzy: 'Unit taking damage:'; rasa: 'Race:'; jednostka: 'Unit:'; upAtak: 'Attack upgrade:';
    upArmory: 'Armor upgrade:'; oblicz: 'Calculate'; obrazenia: 'Damage:'; kalkulator: 'Calculator'; aktywuj: 'Activate';
    blokada: 'Disable Windows keys'; wsparciePolski: 'Support for Polish language in game'; update: 'New version is out';
    update2: 'Do You want to open download page?'; schowek: 'Minimize to tray'; dialog_uruchomiona: 'Application is already running!';
    lossless: '"Lossless video compression"'; streamin: 'Stream on Twitch'; opoznienie: 'Delay:';);

  /// /////////////////////////////   PORTUGEESE
  portugalski: TJezyk = ( // fabiano
    AV2: 'Time:'; AV3: 'Size:'; AV4: 'Dropped frames:'; AV5: 'Bitrate:'; AV6: 'Frames per second:'; AV7: 'Upload:';
    glosnosc: 'Volume control (CTRL + UP/DOWN)'; f1: 'Disable F1'; pause: 'PAUSE for pause/resume game'; altshift: 'Disable ALT + SHIFT';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Add exception to Windows firewall'; znaki: 'Change the character set';
    skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Check latency'; daneKonta: 'Account settings:';
    ustawieniaCzatu: 'Chat settings:'; ustawieniaStrumnieniowania: 'Streaming settings:'; ustawieniaKonta: 'Channel settings:';
    ustawGre: 'Set game: "StarCraft: Brood War"'; ustawOpis: 'Set description:'; listaWidzow: 'List of viewers'; Pogrubienie: 'Bold';
    bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Check for updates'; nagrywajLokalnie: 'Local recording'; caps: 'Disable CAPS LOCK';
    jump: 'Winamp jump to file'; wyswietl: 'Display in game:'; funkcje: 'Functions:'; kbHook: 'Keyboard hook';
    listStrumieni: 'Update list of streams'; guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers';
    listaGraczy: 'List of players'; jKoreanski: 'Support for Korean language in game'; track: 'Song information';
    au1: 'OAuth should be generated here:'; au2: 'This should looks like this: '; au3: 'next copy paste all text.'; sekundy: 'seconds';
    dyskTwardy: 'Save to disk'; wysylanieWToku: 'Streaming on Twitch...'; zakonczoneNiepo: 'Streaming on Twitch failed';
    wybierzAkcje: 'Choose action for user '; uprawienia: 'Promote to moderator'; tymczasowyBan: 'Ban temporarily';
    zbanuj: 'Ban permanently'; cofUpr: 'Demote moderator'; listaOP: 'Show a list of all moderators'; odbanuj: 'Reverse ban';
    pobierzKlucz: 'Download stream key and save settings'; priorytet: 'Higher priority for StarCraft';
    trwaPobieranieKlucza: 'Downloading stream key...'; opuscil: 'Parts:'; dolaczyl: 'Joins:'; polaczono: 'Connected with';
    rozlaczono: 'Disconnected from'; fishiInne: 'Fish and others'; naprawKolory: 'Corrigir cores'; emulacjaDD: 'Emular DirectDraw';
    upnp: 'Habilitar UPnP'; bramki: 'Adicionar gateway'; wmode: 'Executar StarCraft em modo janela'; start: 'Iniciar';
    powiadomienie: 'Notificação sonora'; jezyk: 'Linguagem:'; pokazLog: 'Mostrar log'; sprawdzTrase: 'Traçar rota';
    pokazKraj: 'Mostrar país'; hosty: 'Resolver nome do host'; pokazKlucz: 'Mostrar CD Key'; startCam: 'Iniciar:'; stopCam: 'Parar:';
    lobby: 'Lobby:'; lobbyPrzed: 'Lobby antes do jogo:'; wGrze: 'In game:'; odtwarzajDz: 'Tocar som:'; kanal: 'Canal:'; polacz: 'Conectar';
    polaczony: 'Conectado'; rozlacz: 'Desconectar'; konfiguruj: 'Configure'; liczbaWidzow: 'Número de expectadores:';
    pokazCzas: 'Show time'; pokazWeWy: 'Show joins/parts'; wyslij: 'Enviar'; rozne: 'Misc.'; nagrywanie: 'Record'; dotacje: 'Donate';
    oProgramie: 'About'; uVideo: 'Video device:'; uAudio: 'Audio device:'; kodekVideo: 'Video compression:';
    kodekAudio: 'Audio compression:'; podglad: 'Preview'; nagrywaj: 'Record'; tLogin: 'Login:'; tHaslo: 'Senha:';
    domyslnyKanal: 'Canal padrão:'; zapiszCzat: 'Salvar chat'; autoPolaczenie: 'Conectar-se automaticamente durante a inicialização';
    zapisz: 'Salvar'; maxBitrate: 'Taxa de bits máxima:'; rodzajPrzeplywnosci: 'Método de codificação:'; stala: 'Constante (CBR)';
    zmienna: 'Variável (VBR)'; przeplywnosc: 'Taxa de bits:'; kanaly: 'Canais:'; czestoliwosc: 'Taxa de amostra:'; wartosc: 'Valor:';
    predkosc: 'Mudar sensibilidade do mouse'; overlay: 'Mostrar overlay'; czasGry: 'Tempo do jogo'; czas: 'Horário';
    trybObs: 'Modo observador'; czatTwitcha: 'Twitch chat'; apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay';
    ukryjPasek: 'Esconder barra de progresso do replay'; usunLimit: 'Remover limite de slots para replays';
    wyswietlZdjecie: 'Display picture'; autor: 'Autor:'; kontakt: 'Contato:'; dataBuildu: 'Hora:'; wersja: 'Versão:';
    podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Automatically logon'; dodaj: 'Add';
    usun: 'Delete'; zapisujCzatBn: 'Save Battle.net chat'; czcionka: 'Change font (Battle.net)'; czcionkaDomyslna: 'Restore font';
    otworzKatalog: 'Open directory with recordings'; aero: 'Windows Aero'; trwaNagrywanie: 'Recording:'; wiadomosci: 'Messages';
    jednAt: 'Unit dealing damage:'; jednPrzy: 'Unit taking damage:'; rasa: 'Race:'; jednostka: 'Unit:'; upAtak: 'Attack upgrade:';
    upArmory: 'Armor upgrade:'; oblicz: 'Calculate'; obrazenia: 'Damage:'; kalkulator: 'Calculator'; aktywuj: 'Activate';
    blokada: 'Disable Windows keys'; wsparciePolski: 'Support for Polish language in game'; update: 'New version is out';
    update2: 'Do You want to open download page?'; schowek: 'Minimize to tray'; dialog_uruchomiona: 'Application is already running!';
    lossless: '"Lossless video compression"'; streamin: 'Stream on Twitch'; opoznienie: 'Delay:';);

  /// /////////////////////////////   CROATIAN
  chorwacki: TJezyk = ( // Quirinus
    AV2: 'Vrijeme:'; AV3: 'Veličina:'; AV4: 'Propali frameovi:'; AV5: 'Bitrate:'; AV6: 'Frameova u sekundi:'; AV7: 'Upload:';
    glosnosc: 'Kontrola glasnoće (CTRL + UP/DOWN)'; f1: 'Onemogući F1'; pause: 'PAUSE za pauzirat/nastavit igru';
    altshift: 'Onemogući ALT + SHIFT'; zagubione: 'Popravi "izgubljen" unos sa tipkovnice'; zapora: 'Dodaj izuzetak u Windows vatrozid';
    znaki: 'Promjeni skup slova'; skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Provjeri latenciju'; daneKonta: 'Postavke računa:';
    ustawieniaCzatu: 'Postavke chata:'; ustawieniaStrumnieniowania: 'Postavke streamanja:'; ustawieniaKonta: 'Postavke kanala:';
    ustawGre: 'Postavi igru: "StarCraft: Brood War"'; ustawOpis: 'Postavi opis:'; listaWidzow: 'Lista gledatelja';
    Pogrubienie: 'Podebljano'; bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Provjeravaj promjene';
    nagrywajLokalnie: 'Lokalno snimanje'; caps: 'Onemogući CAPS LOCK'; jump: 'Winamp jump to file'; wyswietl: 'Pokaži u igri:';
    funkcje: 'Funkcije:'; kbHook: 'Priključci za tipkovnicu'; listStrumieni: 'Ažuriraj listu streamova';
    guiUniemozliwi: 'GUIfixes sprečava povezivanje sa službenim Blizzard poslužiteljima'; listaGraczy: 'Lista igrača';
    jKoreanski: 'Podrška za korejski jezik u igri'; track: 'Informacije o pjesmi'; au1: 'OAuth bi trebao biti generiran ovdje:';
    au2: 'To bi trebalo izgleda ovako: '; au3: 'sljedeće kopiraj i zaljepi sav tekst.'; sekundy: 'sekundi'; dyskTwardy: 'Spremi na disk';
    wysylanieWToku: 'Streamanje na Twitchu...'; zakonczoneNiepo: 'Streamanje na Twitchu neuspješno zaustavljeno';
    wybierzAkcje: 'Izaberite akciju za korisnika '; uprawienia: 'Promoviraj u moderatora'; tymczasowyBan: 'Privremeno banaj';
    zbanuj: 'Trajno banaj'; cofUpr: 'Ukloni moderatora'; listaOP: 'Prikaži listu svih moderatora'; odbanuj: 'Ukloni ban';
    pobierzKlucz: 'Preuzimanje ključa za streamanje i spremanje postavki'; priorytet: 'Veći prioritet za StarCraft';
    trwaPobieranieKlucza: 'Preuzimam ključ streama...'; opuscil: 'Odlasci:'; dolaczyl: 'Dolasci:'; polaczono: 'Poveži se sa';
    rozlaczono: 'Odspojen od'; fishiInne: 'Fish i ostali'; naprawKolory: 'Popravak boja'; emulacjaDD: 'DirectDraw emulacija';
    upnp: 'Omogući UPnP'; bramki: 'Dodaj gateway-e'; wmode: 'Pokreni StarCraft u prozoru'; start: 'Startaj';
    powiadomienie: 'Obavijesti zvukom'; jezyk: 'Jezik:'; pokazLog: 'Pokaži zapisnik'; sprawdzTrase: 'Trace route:';
    pokazKraj: 'Pokaži državu'; hosty: 'Razluči ime hosta'; pokazKlucz: 'Pokaži CD Key'; startCam: 'Start:'; stopCam: 'Stop:';
    lobby: 'Lobby:'; lobbyPrzed: 'Lobby prije partije:'; wGrze: 'U igri:'; odtwarzajDz: 'Sviraj zvuk:'; kanal: 'Kanal:'; polacz: 'Poveži';
    polaczony: 'Povezano'; rozlacz: 'Prekini'; konfiguruj: 'Konfiguriraj'; liczbaWidzow: 'Broj gledatelja:'; pokazCzas: 'Vrijeme';
    pokazWeWy: 'Pokaži dolaske/ odlaske'; wyslij: 'Pošalji'; rozne: 'Razno'; nagrywanie: 'Snimanje'; dotacje: 'Doniraj';
    oProgramie: 'O programu'; uVideo: 'Video uređaj:'; uAudio: 'Audio uređaj:'; kodekVideo: 'Video kompresija:';
    kodekAudio: 'Audio kompresija:'; podglad: 'Pregled'; nagrywaj: 'Snimanje'; tLogin: 'Login:'; tHaslo: 'Lozinka:';
    domyslnyKanal: 'Pred-definirani kanal:'; zapiszCzat: 'Spremi chat'; autoPolaczenie: 'Automatski se poveži pri pokretanju';
    zapisz: 'Spremi'; maxBitrate: 'Maksimalni bitrate:'; rodzajPrzeplywnosci: 'Metoda enkodiranja:'; stala: 'Konstantni (CBR)';
    zmienna: 'Promjenjivi (VBR)'; przeplywnosc: 'Bitrate:'; kanaly: 'Kanali:'; czestoliwosc: 'Sample rate:'; wartosc: 'Vrijednost:';
    predkosc: 'Brzina miša'; overlay: 'Pokaži overlay'; czasGry: 'Vrijeme u igri'; czas: 'Vrijeme'; trybObs: 'Obs mod';
    czatTwitcha: 'Twitch chat'; apm: 'APM'; winamp: 'Winamp / AIMP'; autoreplay: 'Autoreplay'; ukryjPasek: 'Sakrij traku napretka replaya';
    usunLimit: 'Ukloni limit mjesta u replayu'; wyswietlZdjecie: 'Slika prikaza'; autor: 'Autor:'; kontakt: 'Kontakt:';
    dataBuildu: 'Vrijeme gradnje:'; wersja: 'Verzija:'; podziekowania: 'Hvala na pomoći u stvaranju programa:';
    wykorzystano: 'Program koristi sljedeće binarne datoteke iz drugih izvora:'; logowanie: 'Automatski se poveži'; dodaj: 'Dodaj';
    usun: 'Izbriši'; zapisujCzatBn: 'Spremi Battle.net chat'; czcionka: 'Promjeni font (Battle.net)'; czcionkaDomyslna: 'Vrati font';
    otworzKatalog: 'Otvori mapu sa snimkama'; aero: 'Windows Aero'; trwaNagrywanie: 'Snimanje:'; wiadomosci: 'Poruke';
    jednAt: 'Jedinica koja napada:'; jednPrzy: 'Jedinica koja se brani:'; rasa: 'Rasa:'; jednostka: 'Jedinica:'; upAtak: 'Attack upgrade:';
    upArmory: 'Armor upgrade:'; oblicz: 'Izračunaj'; obrazenia: 'Damage:'; kalkulator: 'Kalkulator'; aktywuj: 'Aktiviraj';
    blokada: 'Onemogući Windows dugme'; wsparciePolski: 'Podrška za poljski jezik u igri'; update: 'Nova verzija je dostupna';
    update2: 'Želite li otvoriti stranicu za preuzimanje?'; schowek: 'Minimiziraj u tray';
    dialog_uruchomiona: 'Aplikacija je već pokrenuta!'; lossless: '"Video kompresija bez gubitaka"'; streamin: 'Streamaj na Twitchu';
    opoznienie: 'Odgoda:';);

  /// /////////////////////////////   KOREAN
  koreanski: TJezyk = ( // iCCup.ryuikan
    AV2: '시간:'; AV3: '사이즈:'; AV4: '드롭 프레임:'; AV5: '비트레이트:'; AV6: '초당 프레임:'; AV7: '업로드:'; glosnosc: '볼륨 조절 (CTRL + UP/DOWN)'; f1: 'F1 비활성화';
    pause: '정지/재개를 위한 PAUSE'; altshift: '비활성화 ALT + SHIFT'; zagubione: 'Fix "lost" keyboard input'; zapora: '윈도우 방화벽에 예외 사항으로 설정';
    znaki: 'Change the character set'; skrin: '스크린샷 (CTRL + ALT + P)'; sprawdzLatency: 'Latency 확인'; daneKonta: '계정 세팅:';
    ustawieniaCzatu: '채팅 세팅:'; ustawieniaStrumnieniowania: '방송 세팅:'; ustawieniaKonta: '채널 세팅:'; ustawGre: '게임 설정: "StarCraft: Brood War"';
    ustawOpis: '속성:'; listaWidzow: '시청자 수'; Pogrubienie: '굵게'; bnCzat: 'Battle.net 채팅'; sprawdzanieAktualizacji: '업데이트 확인';
    nagrywajLokalnie: '로컬 녹화'; caps: 'CAPS LOCK 비활성화'; jump: 'Winamp 에서 음악 파일 이동'; wyswietl: '게임에서 보이기:'; funkcje: '기능들:';
    kbHook: '잡다한 키보드 기능 막기'; listStrumieni: '방송목록'; guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers';
    listaGraczy: '플레이어 목록'; jKoreanski: '한국어 지원 (게임내)'; track: '노래정보 보여주기'; au1: 'OAuth 는 여기서 만들어져야 합니다:'; au2: '이것은 이렇게 되야 합니다: ';
    au3: '다음 모든 글을 복사하고 붙여넣기.'; sekundy: '초'; dyskTwardy: '디스크에 저장하기'; wysylanieWToku: 'Twitch 에서 방송중...';
    zakonczoneNiepo: 'Twitch 에서의 방송이 오류로 인해 종료되었습니다'; wybierzAkcje: '원하는 동작을 선택 '; uprawienia: '매니저 임명하기'; tymczasowyBan: '일시적으로 채팅금지 시키기';
    zbanuj: '영원히 채팅금지 시키기'; cofUpr: '매니저 권한 상실시키기'; listaOP: '매니저 목록 보이기'; odbanuj: '금지 풀기'; pobierzKlucz: '방송키를 다운받기 / 방송설정 저장하기';
    priorytet: '스타크래프트의 우선실행 순위 높이기'; trwaPobieranieKlucza: '방송키를 다운중입니다...'; opuscil: '퇴장:'; dolaczyl: '입장:'; polaczono: '로 접속 되었습니다';
    rozlaczono: '에서 접속해제 되었습니다'; fishiInne: '피쉬와 기타서버'; naprawKolory: '색상 수정'; emulacjaDD: '"DirectDraw" 에뮬레이션'; upnp: 'UPnP를을 사용';
    bramki: '게이트웨이를 추가'; wmode: '스타를 윈도 모드 실행'; start: '시작'; powiadomienie: '소리통보'; jezyk: '언어:'; pokazLog: '로그보기'; sprawdzTrase: '경로추적';
    pokazKraj: '국가표시'; hosty: '호스트 이름확인'; pokazKlucz: 'CD Key 보기'; startCam: '시작:'; stopCam: '중지:'; lobby: '로비:'; lobbyPrzed: '경기전 로비:';
    wGrze: '게임중:'; odtwarzajDz: '소리 재생:'; kanal: '채널:'; polacz: '연결'; polaczony: '연결됌'; rozlacz: '분리'; konfiguruj: '설정';
    liczbaWidzow: '지금 보는이 수:'; pokazCzas: '사간'; pokazWeWy: '입퇴장 보이기'; wyslij: '보내기'; rozne: '기타'; nagrywanie: '녹음중'; dotacje: '기부하기';
    oProgramie: '런처에 관해'; uVideo: '동영상 카메라:'; uAudio: '소리 녹음기:'; kodekVideo: '동영상 압축:'; kodekAudio: '소리 압축:'; podglad: '미리보기';
    nagrywaj: '녹음중'; tLogin: '로그인:'; tHaslo: '비밀번호:'; domyslnyKanal: '입장채널:'; zapiszCzat: '채팅 저장하기'; autoPolaczenie: '시작하면 자동 연결하기';
    zapisz: '저장하기'; maxBitrate: '최고 음질:'; rodzajPrzeplywnosci: '인코딩 수단:'; stala: '지속적인 (CBR)'; zmienna: '변화하는 (VBR)'; przeplywnosc: '음질:';
    kanaly: '채널:'; czestoliwosc: '샘플 사양:'; wartosc: '가치:'; predkosc: '마우스 속도 바꾸기'; overlay: '사진공유'; czasGry: '게임시간'; czas: '사간';
    trybObs: '보기모드'; czatTwitcha: 'Twitch 채팅'; apm: 'APM'; winamp: '윈엠프 / AIMP'; autoreplay: '자동저장됀 리플레이'; ukryjPasek: '리플레이 진행률 숨기기';
    usunLimit: '리플레이 슬롯 제한제거'; wyswietlZdjecie: '사진보이기'; autor: '저자:'; kontakt: '연락처:'; dataBuildu: '만들어진 시간:'; wersja: '버젼:';
    podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: '자동 로그인'; dodaj: '추가'; usun: '삭제';
    zapisujCzatBn: '베틀넷 채팅 저장하기'; czcionka: '베틀넷 글자체 바꾸기'; czcionkaDomyslna: '글자체 복구'; otworzKatalog: '녹화된 폴더 열기'; aero: '윈도우 에이로 효과';
    trwaNagrywanie: '녹화:'; wiadomosci: '편지'; jednAt: '주는 데미지:'; jednPrzy: '받는 데미지:'; rasa: '종족:'; jednostka: '유닛:'; upAtak: '공업:';
    upArmory: '방업:'; oblicz: '계산'; obrazenia: '데미지:'; kalkulator: '계산기'; aktywuj: '활성화'; blokada: '윈도우키 방지';
    wsparciePolski: '폴란드어 지원하기 (게임내)'; update: '새로운 버젼이 나왔습니다'; update2: '새 버젼을 다운 받으시겠습니까?'; schowek: '트레이창으로 최소화';
    dialog_uruchomiona: '해당 앱이 실행중입니다'; lossless: '"손실없는 비디오 압축"'; streamin: '트위치에서 방송'; opoznienie: '지연:';);

  /// /////////////////////////////   GREEK
  grecki: TJezyk = ( // ffswowsucks
    AV2: 'Time:'; AV3: 'Size:'; AV4: 'Dropped frames:'; AV5: 'Bitrate:'; AV6: 'Frames per second:'; AV7: 'Upload:';
    glosnosc: 'Volume control (CTRL + UP/DOWN)'; f1: 'Disable F1'; pause: 'PAUSE for pause/resume game'; altshift: 'Disable ALT + SHIFT';
    zagubione: 'Fix "lost" keyboard input'; zapora: 'Add exception to Windows firewall'; znaki: 'Change the character set';
    skrin: 'Screenshot (CTRL + ALT + P)'; sprawdzLatency: 'Check latency'; daneKonta: 'Account settings:';
    ustawieniaCzatu: 'Chat settings:'; ustawieniaStrumnieniowania: 'Streaming settings:'; ustawieniaKonta: 'Channel settings:';
    ustawGre: 'Set game: "StarCraft: Brood War"'; ustawOpis: 'Set description:'; listaWidzow: 'List of viewers'; Pogrubienie: 'Bold';
    bnCzat: 'Battle.net chat'; sprawdzanieAktualizacji: 'Check for updates'; nagrywajLokalnie: 'Local recording'; caps: 'Disable CAPS LOCK';
    jump: 'Winamp jump to file'; wyswietl: 'Display in game:'; funkcje: 'Functions:'; kbHook: 'Keyboard hook';
    listStrumieni: 'Update list of streams'; guiUniemozliwi: 'GUIfixes prevents You join on official Blizzard servers';
    listaGraczy: 'List of players'; jKoreanski: 'Support for Korean language in game'; track: 'Song information';
    au1: 'OAuth should be generated here:'; au2: 'This should looks like this: '; au3: 'next copy paste all text.'; sekundy: 'seconds';
    dyskTwardy: 'Save to disk'; wysylanieWToku: 'Streaming on Twitch...'; zakonczoneNiepo: 'Streaming on Twitch failed';
    wybierzAkcje: 'Choose action for user '; uprawienia: 'Promote to moderator'; tymczasowyBan: 'Ban temporarily';
    zbanuj: 'Ban permanently'; cofUpr: 'Demote moderator'; listaOP: 'Show a list of all moderators'; odbanuj: 'Reverse ban';
    pobierzKlucz: 'Download stream key and save settings'; priorytet: 'Higher priority for StarCraft';
    trwaPobieranieKlucza: 'Downloading stream key...'; opuscil: 'Parts:'; dolaczyl: 'Joins:'; polaczono: 'Connected with';
    rozlaczono: 'Disconnected from'; fishiInne: 'Fish and others'; naprawKolory: 'Διόρθωση Χρωμάτων'; emulacjaDD: 'Εξομοιωτής DirectDraw';
    upnp: 'Ενεργοποίηση UPnP'; bramki: 'Πύλες Battle.net'; wmode: 'Τρέξτε το StarCraft σε λειτουργεία window'; start: 'Έναρξη';
    powiadomienie: 'Ήχοι Ειδοποίησης'; jezyk: 'Γλώσσα:'; pokazLog: 'Εμφάνιση log'; sprawdzTrase: 'Χάραξη Διαδρομής:';
    pokazKraj: 'Εμφάνιση Χώρας'; hosty: 'Επίλυση hostname'; pokazKlucz: 'Εμφάνιση CD Key'; startCam: 'Έναρξη:'; stopCam: 'Stop:';
    lobby: 'Αίθουσα αναμονής:'; lobbyPrzed: 'Αίθουσα αναμονής Παιχνιδιού:'; wGrze: 'Μέσα στο παιχνίδι:'; odtwarzajDz: 'Αναπαραγωγή Ήχου:';
    kanal: 'Κανάλι:'; polacz: 'Συνδέσου'; polaczony: 'Συνδεδεμένος'; rozlacz: 'Αποσυνδέσου'; konfiguruj: 'Ρυθμίσεις';
    liczbaWidzow: 'Θεατές:'; pokazCzas: 'Εμφάνιση ώρας'; pokazWeWy: 'Εμφάνιση joins/ parts'; wyslij: 'Αποστολή'; rozne: 'Διάφορα';
    nagrywanie: 'Καταγραφή'; dotacje: 'Donate'; oProgramie: 'About'; uVideo: 'Συσκευή βίντεο:'; uAudio: 'Συσκευή ήχου:';
    kodekVideo: 'Συμπίεση βίντεο:'; kodekAudio: 'Συμπίεση ήχου:'; podglad: 'Προεπισκόπηση'; nagrywaj: 'Καταγραφή'; tLogin: 'Σύνδεση:';
    tHaslo: 'Κωδικός:'; domyslnyKanal: 'Προεπιλεγμένο Κανάλι:'; zapiszCzat: 'Αποθήκευση Συνομιλίας';
    autoPolaczenie: 'Αυτόματη σύνδεση με την έναρξη'; zapisz: 'Αποθήκευση'; maxBitrate: 'Μάξιμουμ bitrate:';
    rodzajPrzeplywnosci: 'Μέθοδος κωδικοποίησης:'; stala: 'Constant (CBR)'; zmienna: 'Variable (VBR)'; przeplywnosc: 'Bitrate:';
    kanaly: 'Κανάλια:'; czestoliwosc: 'Sample rate:'; wartosc: 'Αξία:'; predkosc: 'Αλλαγή ταχύτητας mouse'; overlay: 'Overlay';
    czasGry: 'Χρόνος παιχνιδιού'; czas: 'Χρόνος'; trybObs: 'Obs mode'; czatTwitcha: 'Συνομιλία Twitch'; apm: 'APM'; winamp: 'Winamp / AIMP';
    autoreplay: 'Autoreplay'; ukryjPasek: 'Hide replay progress bar'; usunLimit: 'Remove replay slot limit';
    wyswietlZdjecie: 'Εμφάνιση εικόνας'; autor: 'Author:'; kontakt: 'Επικοινωνία:'; dataBuildu: 'Build time:'; wersja: 'Έκδοση:';
    podziekowania: 'Special thanks for help in creation of this program go to:';
    wykorzystano: 'This program uses the following binary files from third parties:'; logowanie: 'Αυτόματη σύνδεση'; dodaj: 'Πρόσθεση';
    usun: 'Διαγραφή'; zapisujCzatBn: 'Αποθήκευση συνομιλίας'; czcionka: 'Αλλαγή φόντου (B.net)'; czcionkaDomyslna: 'Επαναφορά φόντου';
    otworzKatalog: 'Open directory with recordings'; aero: 'Windows Aero'; trwaNagrywanie: 'Καταγραφή:'; wiadomosci: 'Messages';
    jednAt: 'Unit dealing damage:'; jednPrzy: 'Unit taking damage:'; rasa: 'Race:'; jednostka: 'Unit:'; upAtak: 'Attack upgrade:';
    upArmory: 'Armor upgrade:'; oblicz: 'Calculate'; obrazenia: 'Damage:'; kalkulator: 'Calculator'; aktywuj: 'Activate';
    blokada: 'Disable Windows keys'; wsparciePolski: 'Support for Polish language in game'; update: 'New version is out';
    update2: 'Do You want to open download page?'; schowek: 'Minimize to tray'; dialog_uruchomiona: 'Application is already running!';
    lossless: '"Lossless video compression"'; streamin: 'Stream on Twitch'; opoznienie: 'Delay:';);

implementation

begin

end.
