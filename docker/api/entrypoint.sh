#! /bin/bash


python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py init_admin
python manage.py init_accounts
python manage.py continue_tasks &

exec gunicorn api.wsgi:application -b 0.0.0.0:8000 --reload --log-level debug --limit-request-line 8190 --timeout 1000