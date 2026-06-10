# 베이스 이미지로 공식 MySQL 8.4 또는 8.0 버전을 사용합니다.
FROM mysql:8.4

# 컨테이너 실행 시 사용할 환경 변수 (루트 패스워드 및 기본 데이터베이스)
ENV MYSQL_ROOT_PASSWORD=ssafy
ENV MYSQL_DATABASE=ssafylive

# 로컬에 있는 초기화 스크립트를 도커 이미지 내부의 /docker-entrypoint-initdb.d/ 로 복사
# 이 디렉토리에 있는 .sql 및 .sh 파일은 컨테이너 최초 실행 시 자동 실행됩니다.
COPY res/init.sql /docker-entrypoint-initdb.d/

# 헬스체크 설정
# - root 계정으로 로그인하여 서버 상태를 체크합니다.
# - --silent 옵션으로 로그가 과도하게 쌓이는 것을 방지합니다.
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
    CMD mysqladmin ping -uroot -p"$MYSQL_ROOT_PASSWORD" --silent || exit 1

# MySQL 기본 포트 노출
EXPOSE 3306
