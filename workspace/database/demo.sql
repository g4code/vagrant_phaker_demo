CREATE TABLE users (
    user_id  INT(10)      UNSIGNED          AUTO_INCREMENT,
    site_id  INT(10)      UNSIGNED NOT NULL DEFAULT 0,
    username VARCHAR(255)          NOT NULL DEFAULT '',
    email    VARCHAR(255)          NOT NULL DEFAULT '',
    password CHAR(32)              NOT NULL DEFAULT '',
    status   TINYINT(3)   UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id),
    KEY site_id (site_id),
    KEY status (status),
    UNIQUE (username),
    UNIQUE (email, site_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;