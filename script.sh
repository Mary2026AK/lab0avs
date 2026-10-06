#!bin/bash
git init
mkdir ~/lab0
cd ~/lab0
mkdir -p claude_monet/kitchen/hot_station
mkdir -p claude_monet/kitchen/cold_station
mkdir -p claude_monet/hall
mkdir -p claude_monet/office
mkdir -p locker_room
echo "Подготовить горячий цех к вечерней смене
Проверить рабочие места поваров
Макса к плите без разрешения не подпускать" >claude_monet/kitchen/hot_station/barinov_order
echo "Сеня отвечает за мясные блюда
Получить продукты на складе
Перед закрытием проверить остатки" >claude_monet/kitchen/hot_station/senya_task
echo "Федя отвечает за рыбные блюда
Проверить свежесть сибаса и дорадо
Подготовить холодные закуски для гостей" >claude_monet/kitchen/cold_station/fedya_task
echo "Утиная ножка с овощами
Луковый суп по рецепту шефа
Фирменный десерт от Луи
Новое блюдо Макса отправлено на доработку" >claude_monet/kitchen/menu_draft
echo "Столик 3 забронирован на восемнадцать часов
Столик 7 подготовить для постоянных гостей
Большой стол оставить для вечернего банкета" >claude_monet/hall/reservations
echo "Гости похвалили десерт и работу официантов
Один гость слишком долго ждал горячее блюдо
Постоянные гости попросили вернуть старое меню
Новый повар Макс показался гостям растерянным" >claude_monet/hall/guest_reviews
echo "Вика проводит собрание перед открытием ресторана
В семнадцать часов проверить готовность зала
После смены принять отчёт от Макса" >claude_monet/office/vika_schedule
echo "Максим Лавров приехал в Москву из Воронежа
Хочет стать профессиональным поваром
Готов работать в ресторане Claude Monet
Опыта мало, но желания много" >locker_room/max_resume
echo "Лёва должен показать Максу рабочее место
Объяснить правила кухни и порядок выдачи блюд
О результате доложить Виктору Петровичу" >locker_room/leva_note
echo "Владелец ресторана приедет вечером
Подготовить лучший стол в зале
Баринов должен лично представить новое меню" >nagiev_message
echo "Макс прибыл в ресторан вовремя
Лёва выдал ему форму
Первая задача получена от шефа" >first_shift
chmod 755 claude_monet
chmod u=rwx,g=rx,o=--- claude_monet/kitchen
chmod 770 claude_monet/kitchen/hot_station
chmod u=rw,g=r,o=--- claude_monet/kitchen/hot_station/barinov_order
chmod 640 claude_monet/kitchen/hot_station/senya_task
chmod u=rwx,g=rx,o=--- claude_monet/kitchen/cold_station
chmod 600 claude_monet/kitchen/cold_station/fedya_task
chmod u=rw,g=r,o=r claude_monet/kitchen/menu_draft
chmod 755 claude_monet/hall
chmod u=rw,g=rw,o=r claude_monet/hall/reservations
chmod 444 claude_monet/hall/guest_reviews
chmod u=rwx,g=x,o=--- claude_monet/office
chmod 640 claude_monet/office/vika_schedule
chmod u=rwx,g=rx,o=--- locker_room
chmod 600 locker_room/max_resume
chmod u=r,g=r,o=--- locker_room/leva_note
chmod 444 nagiev_message
chmod u=rw,g=r,o=r first_shift
git add .
git commit -m "lab0 первый коммит 3.1"
git push

cp locker_room/max_resume claude_monet/office/candidate_max
cp -r claude_monet/hall claude_monet/kitchen/hall_backup
ln -s ../claude_monet/kitchen/menu_draft locker_room/first_menu
ln -s claude_monet/hall guest_zone
ln first_shift claude_monet/kitchen/shift_plan
cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/cold_station/fedya_task > claude_monet/kitchen/team_tasks
cat locker_room/leva_note >> first_shift
mv nagiev_message claude_monet/office/owner_message
git add .
git commit -m "lab0 второй коммит 3.2"
git push

ls -lR | grep '^-' | sort -k5 -n -r | head -n 5
grep -ri "макс" . | grep -vi "отчёт" | sort -r | head -n 4
grep -Ei 'блюд|продукт' claude_monet/kitchen/hot_station/*_task claude_monet/kitchen/cold_station/*_task | sort | tee /tmp/tasks.txt | wc -w < /tmp/tasks.txt
ls -lR | grep '^-' | awk '$2 == 2' | sort -k9 -r
for f in claude_monet/kitchen/hot_station/*; do [ -f "$f" ] || continue; head -n 1 "$f"; tail -n 1 "$f"; done | sort
grep -i 'гост' claude_monet/hall/guest_reviews | grep -vi 'постоянн' | sort -r | head -n 2
grep -ril "гост" claude_monet/kitchen/hall_backup | wc -l
rm locker_room/max_resume
rm locker_room/first_menu
rm guest_zone
rm first_shift
rm claude_monet/kitchen/shift_plan
rm claude_monet/kitchen/cold_station/fedya_task
rmdir claude_monet/kitchen/cold_station
rm -rf claude_monet/kitchen/hall_backup
git add .
git commit -m "lab0 третий коммит 3.3"
git push
