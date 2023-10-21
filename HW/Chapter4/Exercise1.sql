CREATE TABLE `student` (
    `name` VARCHAR(50) NOT NULL,
    `id` INT NOT NULL,
    `year` INT NOT NULL,
    `major` VARCHAR(40) NOT NULL,
    `phone_num` VARCHAR(20) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `cum_credits` INT NOT NULL DEFAULT 0,
    `avg_grade` DOUBLE NOT NULL DEFAULT 0.0,
    `is_attending` TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;