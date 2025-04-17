#!/bin/sh

# Wait for MySQL to be available
echo "Waiting for MySQL..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1
done

echo "MySQL is up - applying migrations..."
python manage.py migrate
python manage.py collectstatic --noinput

echo "Starting Gunicorn..."
exec gunicorn insurancemanagement-master.wsgi:application --bind 0.0.0.0:8000
