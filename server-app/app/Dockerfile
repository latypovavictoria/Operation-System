# Используем Python в качестве базового образа
FROM python:3.9-slim

# Устанавливаем зависимости
WORKDIR /app
COPY app.py /app/
RUN pip install flask

# Запуск сервера
CMD ["python", "app.py"]

