# Используем официальный Python-образ
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект в контейнер
COPY . .

# Устанавливаем права на entrypoint
RUN chmod +x /app/entrypoint.sh

# Открываем порт 8000 для Django
EXPOSE 8000

# Используем entrypoint для запуска приложения
ENTRYPOINT ["/app/entrypoint.sh"]