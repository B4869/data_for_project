FROM postgres:17

# ติดตั้ง dependencies ที่จำเป็น
RUN apt-get update && apt-get install -y \
    git \
    postgresql-server-dev-17 \
    build-essential

# ดาวน์โหลดและติดตั้ง pgvector
RUN git clone --branch master https://github.com/pgvector/pgvector.git /pgvector \
    && cd /pgvector \
    && make \
    && make install

# สร้าง extension ในฐานข้อมูลเริ่มต้น
RUN echo "CREATE EXTENSION IF NOT EXISTS vector;" > /docker-entrypoint-initdb.d/init-vector.sql