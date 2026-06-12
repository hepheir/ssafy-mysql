-- 추가 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS ssafydb DEFAULT CHARACTER SET utf8mb4;
CREATE DATABASE IF NOT EXISTS ssafylive DEFAULT CHARACTER SET utf8mb4;
CREATE DATABASE IF NOT EXISTS ssafy_ai DEFAULT CHARACTER SET utf8mb4;

-- 새로운 사용자 생성 및 비밀번호 설정 (MySQL 8.0 이상 기준)
CREATE USER 'ssafy'@'%' IDENTIFIED BY 'ssafy';

-- 생성된 모든 데이터베이스에 대한 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'ssafy'@'%';

-- 권한 적용
FLUSH PRIVILEGES;
