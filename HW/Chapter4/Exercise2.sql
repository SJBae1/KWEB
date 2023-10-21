CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(40) NOT NULL,
    `password` VARCHAR(40) NOT NULL,
    `nickname` VARCHAR(50) NOT NULL,
    `profile_link` VARCHAR(100) NOT NULL,
    `profile_msg` VARCHAR(100) NOT NULL,
    `is_withdrawn` TINYINT(1) NOT NULL DEFAULT 0,
    `registration_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `creator` INT NOT NULL,
    `channel_link` VARCHAR(100) NOT NULL,
    `max_capacity` INT NOT NULL,
    `is_withdrawn` TINYINT(1) NOT NULL DEFAULT 0,
    `channel_creation_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creator`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_content` VARCHAR(500) NOT NULL,
    `chat_author` INT NOT NULL,
    `channel_name` INT NOT NULL,
    `chat_creation_date`DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_author`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel_name`)
    REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `block_date` DATETIME  NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;