-- 추가 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS ssafydb;
CREATE DATABASE IF NOT EXISTS ssafylive;

-- 새로운 사용자 생성 및 비밀번호 설정 (MySQL 8.0 이상 기준)
CREATE USER 'ssafy'@'%' IDENTIFIED BY 'ssafy';

-- 생성된 모든 데이터베이스에 대한 권한 부여
GRANT ALL PRIVILEGES ON ssafydb.* TO 'ssafy'@'%';
GRANT ALL PRIVILEGES ON ssafylive.* TO 'ssafy'@'%';

-- 권한 적용
FLUSH PRIVILEGES;
