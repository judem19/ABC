#!/bin/bash
apt-get update && apt-get install -y less
less --version
cd ~
mkdir lab0
cd lab0
git init
mkdir -p eleon/victor/kitchen
mkdir -p eleon/victor/hall
mkdir -p eleon/hotel_office
mkdir -p eleon/reception
mkdir -p eleon/staff_room
mkdir -p eleon/roof
echo "Блюдо от Виктора Баринова
Закуска от Екатерины Семёновой
Десерт для гостей отеля Eleon
Новое блюдо Дениса на проверке у шефа" > eleon/victor/kitchen/new_menu
echo "На кухне подготовить утиную ножку
В зал отправить две рыбные закуски
Для Софии приготовить особый десерт" > eleon/victor/kitchen/dinner_order
echo "Элеонора Андреевна встречает первых гостей
София Яновна проверяет готовность зала
Виктор Баринов представляет новое меню
Костя помогает команде ресторана" > eleon/victor/hall/opening_guests
echo "Ресторан Victor должен открыться вовремя
Баринов отвечает за кухню
София встречает важных гостей
Персонал отеля помогает в зале" > eleon/hotel_office/eleonora_order
echo "Утром проверить ресторан Victor
Днём провести встречу с Элеонорой
Вечером принять первых гостей" > eleon/reception/sofia_schedule
echo "Гости попросили столик рядом с окном
Один гость хочет поговорить с Бариновым
Постоянные гости ждут знакомое блюдо" > eleon/reception/guest_notes
echo "Новый китель приготовлен для шефа
На форме вышито имя Виктор
Китель находится в комнате персонала" > eleon/staff_room/barinov_uniform
echo "Костя приехал помочь перед открытием
Бар готов к вечернему обслуживанию
После смены он ждёт Настю в холле" > eleon/staff_room/kostya_message
echo "Макс передал привет всей команде
Он помнит работу с Виктором Петровичем
Письмо оставлено на крыше отеля" > eleon/roof/max_letter
echo "Баринов поднялся на крышу после смены
Элеонора нашла его возле старого рояля
Команда ресторана собралась вместе" > eleon/roof/roof_event
echo "Ресторан Victor открывается вечером
Баринов проверяет работу кухни
София встречает гостей в зале" > opening_day
chmod 755 eleon
chmod 750 eleon/victor/kitchen
chmod 640 eleon/victor/kitchen/dinner_order
chmod 644 eleon/victor/hall/opening_guests
chmod 710 eleon/hotel_office
chmod 640 eleon/reception/sofia_schedule
chmod 750 eleon/staff_room
chmod 600 eleon/staff_room/barinov_uniform
chmod 640 eleon/roof/max_letter
chmod 644 opening_day
chmod u=rwx,g=rx,o=--- eleon/victor
chmod u=rw,g=r,o=r eleon/victor/kitchen/new_menu
chmod u=rwx,g=rwx,o=--- eleon/victor/hall
chmod u=r,g=r,o=--- eleon/hotel_office/eleonora_order
chmod u=rwx,g=rx,o=x eleon/reception
chmod u=rw,g=r,o=--- eleon/reception/guest_notes
chmod u=r,g=r,o=--- eleon/staff_room/kostya_message
chmod u=rwx,g=rx,o=--- eleon/roof
chmod u=r,g=r,o=--- eleon/roof/roof_event
git add .
git status
git commit -m "Часть 1: создано дерево lab0 и установлены права"
cp eleon/hotel_office/eleonora_order eleon/victor/hall/owner_order
cp -r eleon/roof eleon/victor/roof_archive
ln -s ../victor/kitchen/new_menu eleon/staff_room/current_menu
ln -s eleon/reception hotel_reception
ln opening_day eleon/victor/hall/opening_log
cat eleon/victor/hall/opening_guests eleon/reception/guest_notes > eleon/reception/all_guests
cat eleon/staff_room/kostya_message >> opening_day
mv eleon/roof/max_letter eleon/hotel_office/max_message
git status
git add .
git commit -m "Часть 2: копирование, ссылки и перемещение файлов"
ls -lR eleon | grep "^-" | sort -k5 -nr | head -6
grep -rih "баринов\|софия" eleon | grep -iv "гост" | sort | head -5
grep -rl "гост" eleon/victor/hall eleon/reception | wc -l
for f in eleon/reception/*; do head -1 "$f"; tail -1 "$f"; done | grep -iE "гост|соф" | sort -r
grep -iv "столик" eleon/reception/all_guests | sort -r | head -4 | wc -w
ls -lR | grep "^-" | awk '$2 == 2' | sort -k9
grep -rli "баринов\|макс" eleon/victor/roof_archive | wc -l
rm -f eleon/hotel_office/eleonora_order
rm eleon/staff_room/current_menu
rm hotel_reception
rm opening_day
rm eleon/victor/hall/opening_log
rm -f eleon/roof/roof_event
rmdir eleon/roof
rm -rf eleon/victor/roof_archive
git status
git add .
git commit -m "Часть 3: поиск, фильтрация и удаление"